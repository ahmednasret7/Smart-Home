import Adafruit_DHT
import RPi.GPIO as GPIO
from time import sleep
from gpiozero import LightSensor, Buzzer, MotionSensor, AngularServo, LED, DistanceSensor
import threading
import firebase_admin
from firebase_admin import credentials
from firebase_admin import db

# Initialize Firebase
cred = credentials.Certificate("smart-home.json")
firebase_admin.initialize_app(cred, {
    "databaseURL": ""  # Replace with your Firebase database URL
})
LED_PIN= 26 # removed
LED_PIN1 = 19
LED_PIN2 = 13 #removed
LED_PIN3 = 6 #removed
DHT_SENSOR = Adafruit_DHT.DHT22
DHT_PIN = 2
GAS_SENSOR_PIN = 14
FLAME_SENSOR_PIN = 5
LDR_SENSOR_PIN = 10
MOTION_SENSOR_PIN = 24
ECHO_PIN = 25 #for ultra sonic
TRIG_PIN = 8  #for ultra sonic
SERVO_PIN_CURTAIN = 15
SERVO_PIN_GARAGE = 23
buzzer1 = Buzzer(22)
# #buzzer2 = Buzzer(4) 
relay_pin = 17 #for fan
RAIN_SENSOR_PIN = 27 #rain sensor
# Define references to your Firebase database nodes
temp_humidity_ref = db.reference("temperature_humidity")
gas_sensor_ref = db.reference("gas_sensor")
flame_sensor_ref = db.reference("flame_sensor")
ldr_sensor_ref = db.reference("ldr_sensor")
motion_sensor_ref = db.reference("motion_sensor")
servo_control_curtain_ref = db.reference("servo_control_curtain")
servo_control_garage_ref = db.reference("servo_control_garage")
led_status_ref = db.reference('led_status')
distance_sensor_ref = db.reference("distance_sensor")
fan_status_ref = db.reference("fan_status")
water_leakage_sensor_ref = db.reference("water_leakage_sensor") 
# Update the sensor functions to send data to Firebase
initial_curtain=0
servo = AngularServo(SERVO_PIN_CURTAIN,initial_angle=initial_curtain, min_pulse_width=0.0006, max_pulse_width=0.0023)
current_angle=initial_curtain
servo_garage = AngularServo(SERVO_PIN_GARAGE,initial_angle=90, min_pulse_width=0.0006, max_pulse_width=0.0023)
def temperature_humidity_sensor():
    while True:
        humidity, temperature = Adafruit_DHT.read_retry(DHT_SENSOR, DHT_PIN)

        if humidity is not None and temperature is not None:
            print("Temp={0:0.1f}*C  Humidity={1:0.1f}%".format(temperature, humidity))
            temp_humidity_ref.set({"temperature": temperature, "humidity": humidity})
        else:
            print("Failed to retrieve data from humidity sensor")
        sleep(1)

def gas_sensor():
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(GAS_SENSOR_PIN, GPIO.IN)
    try:
        while True:
            if GPIO.input(GAS_SENSOR_PIN):
                gas_sensor_ref.set({"gas_leakage_detected": False})
                buzzer1.off()  # Turn off the buzzer
                ##buzzer2.off()  # Turn off the buzzer
            else:
                print("Gas leakage detected")
                gas_sensor_ref.set({"gas_leakage_detected": True})
                buzzer1.on()  # Turn on the buzzer
                #buzzer2.on()  # Turn on the buzzer
                sleep(3)
            sleep(1)
    finally:
        print("Cleaning up...")
        GPIO.cleanup()
def flame_sensor():
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(FLAME_SENSOR_PIN, GPIO.IN)
    try:
        # def callback(FLAME_SENSOR_PIN):
        #     print("flame detected")
        #     flame_sensor_ref.set({"flame_detected": True})
        #     buzzer1.on()  # Turn on the buzzer
        #     #buzzer2.on()  # Turn on the buzzer
        def callback(FLAME_SENSOR_PIN):
            # if GPIO.input(FLAME_SENSOR_PIN):
            #     print("No flame detected")
            #     flame_sensor_ref.set({"flame_detected": False})
            #     buzzer1.off()  # Turn off the buzzer
            #     #buzzer2.off()  # Turn off the buzzer
            # else:
            print("Flame detected")
            flame_sensor_ref.set({"flame_detected": True})
            buzzer1.on()  # Turn on the buzzer
            #buzzer2.on()  # Turn on the buzzer
            sleep(3)
            flame_sensor_ref.set({"flame_detected": False})

        GPIO.add_event_detect(FLAME_SENSOR_PIN, GPIO.BOTH, bouncetime=300)
        GPIO.add_event_callback(FLAME_SENSOR_PIN, callback)
        while True:
            sleep(1)
    finally:
        print("Cleaning up...")
        GPIO.cleanup()

def ldr_sensor():
    ldr = LightSensor(LDR_SENSOR_PIN)
    # servo = AngularServo(SERVO_PIN_CURTAIN, min_pulse_width=0.0006, max_pulse_width=0.0023)
    closed= True
    while True:
        print(ldr.value)
        ldr_value = ldr.value
        control_status = servo_control_curtain_ref.get()["control"]
        if ldr_value > 0.1 and control_status == 'OFF' and closed:
            for angle in range(0, 91): # to open curtain
                servo.angle = angle
                sleep(0.1) 
            closed = False
            # servo_control_curtain_ref.set({"angle": 100})
        elif ldr_value < 0.1 and control_status == 'OFF' and not closed:
            for angle in range(90, -1,-1): # to close curtain
                servo.angle = angle
                sleep(0.1)
            closed = True
        ldr_sensor_ref.set({"value": ldr.value})
        sleep(10)  

def motion_sensor():
    led3 = LED(LED_PIN3)
    pir = MotionSensor(MOTION_SENSOR_PIN)
    while True:
        pir.wait_for_motion()
        print("You moved")
        motion_sensor_ref.set({"motion_detected": True})
        led3.on()
        sleep(5)
        pir.wait_for_no_motion()
        motion_sensor_ref.set({"motion_detected": False})
        led3.off()

def distance_sensor():
    sensor = DistanceSensor(echo=ECHO_PIN, trigger=TRIG_PIN)
    while True:
        distance = sensor.distance * 100  # Convert distance to centimeters
        if distance < 15:
                buzzer1.on()  
                #buzzer2.on()  
                sleep(3)
        else:
                buzzer1.off()
                #buzzer2.off()
        print("Distance: {:.2f} cm".format(distance))
        distance_sensor_ref.set({"distance": distance})
        sleep(1)

def led_control():
    led = LED(LED_PIN)
    led1 = LED(LED_PIN1)
    led2 = LED(LED_PIN2)
    # led_status_ref.set({'light': 'OFF','light1': 'OFF', 'light2': 'OFF'})
    while True:
        light_status = led_status_ref.get()  # Get the light status from the dictionary
        print(light_status)
        if light_status['light'] == "ON":
            led.on()
        elif light_status['light'] == "OFF":
            led.off()
        
        if light_status['light1'] == "ON":
            led1.on()
        elif light_status['light1'] == "OFF":
            led1.off()

        if light_status['light2'] == "ON":
            led2.on()
        elif light_status['light2'] == "OFF":
            led2.off()

        sleep(1)  # Check the status every second


def servo_control_curtain():
    global current_angle
    # servo = AngularServo(SERVO_PIN_CURTAIN, min_pulse_width=0.0006, max_pulse_width=0.0023)
    # servo_control_curtain_ref.set({'angle': 0,'control': 'ON'})
    while True:
        control_status = servo_control_curtain_ref.get()["control"]
        if control_status =='ON':
            control_value = servo_control_curtain_ref.get()["angle"]
            # Map the control value to the servo angle (0 to 90)
            servo_angle = int((control_value/100) * 90)#(control_value / 100.0) * 180 - 90
            if servo_angle > current_angle:
                for angle in range(current_angle, servo_angle+1): # to open curtain 
                    servo.angle = angle
                    sleep(0.1)
            elif servo_angle < current_angle:
                for angle in range(current_angle, servo_angle-1,-1): # to close curtain
                    servo.angle = angle
                    sleep(0.1)     
            current_angle=servo_angle    
            # servo.angle = servo_angle
            # servo_control_curtain_ref.set({"angle": servo_angle})
        sleep(1)


def servo_control_garage():
    servo_control_garage_ref.set({"garage": 'CLOSE'})
    closed= True
    while True:
        servo_control_garage = servo_control_garage_ref.get()["garage"]
        if servo_control_garage == "OPEN" and closed:
            for angle in range(90, -61,-1): # to open garage 
                servo_garage.angle = angle
                sleep(0.1) 
            closed = False
        elif servo_control_garage == "CLOSE" and not closed:
            for angle in range(-60, 91): # to close the garage
                servo_garage.angle = angle
                sleep(0.1)
            closed = True
        # servo_control_garage_ref.set({"angle": servo_garage.angle})
        # servo_control_garage_ref.set({"GARAGE": servo_control_garage})
        sleep(1)


def fan_control():
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(relay_pin, GPIO.OUT)
    fan_status_ref.set({'fan': 'OFF'})  # Initialize the fan status as OFF b3mlha awl mra bs a7otha fl db
    try:
        while True:
            fan_status = fan_status_ref.get()['fan']  # Get the fan status from the database
            temperature_fan=temp_humidity_ref.get()["temperature"]
            if temperature_fan>15:
                GPIO.output(relay_pin, GPIO.LOW)  # Turn on the relay low 3l4an low level trigger
            else:
                GPIO.output(relay_pin, GPIO.HIGH)  # Turn off the relay

            sleep(1)  # Check the status every second

    finally:
        print("Cleaning up...")
        GPIO.cleanup()   
    
def rain_sensor():
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(RAIN_SENSOR_PIN, GPIO.IN)
    
    try:
        while True:
            if not GPIO.input(RAIN_SENSOR_PIN):
                print("Water leakage detected")
                water_leakage_sensor_ref.set({"water_leakage_detected": True})
                buzzer1.on()  # Turn on the buzzer
                #buzzer2.on()  # Turn on the buzzer
                sleep(3)
            else:
                water_leakage_sensor_ref.set({"water_leakage_detected": False})
                buzzer1.off()  # Turn off the buzzer
                #buzzer2.off()  # Turn off the buzzer
            sleep(1)
    finally:
        print("Cleaning up...")
        GPIO.cleanup()
            
if __name__ == "__main__":
    sensors = [
        threading.Thread(target=temperature_humidity_sensor),
        threading.Thread(target=gas_sensor),
        threading.Thread(target=flame_sensor),
        threading.Thread(target=ldr_sensor),
        threading.Thread(target=motion_sensor),
        threading.Thread(target=servo_control_curtain),
        threading.Thread(target=led_control),
        threading.Thread(target=distance_sensor),
        threading.Thread(target=fan_control),
        threading.Thread(target=servo_control_garage),
        threading.Thread(target=rain_sensor)
    ]

    for sensor in sensors:
        sensor.start()

    for sensor in sensors:
        sensor.join()