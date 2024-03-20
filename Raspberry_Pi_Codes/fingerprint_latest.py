from time import sleep
import serial
import adafruit_fingerprint
from gpiozero import AngularServo , Buzzer

uart = serial.Serial("/dev/ttyAMA1", baudrate=57600, timeout=1)
finger = adafruit_fingerprint.Adafruit_Fingerprint(uart)
servo = AngularServo(18,initial_angle=90, min_pulse_width=0.0006, max_pulse_width=0.0023)  
buzzer = Buzzer(4) 
def get_fingerprint():
    """Get a finger print image, template it, and see if it matches!"""
    print("Waiting for image...")
    while finger.get_image() != adafruit_fingerprint.OK:
        pass
    print("Templating...")
    if finger.image_2_tz(1) != adafruit_fingerprint.OK:
        return False
    print("Searching...")
    if finger.finger_search() != adafruit_fingerprint.OK:
        return False
    return True
counter = 0
while True:
    if get_fingerprint():
        print("Detected #", finger.finger_id, "with confidence", finger.confidence)
        sleep(1)
        for angle in range(90, -1,-1): # to open door 
            servo.angle = angle
            sleep(0.1) 
        sleep(5)  # Wait for x seconds
        for angle in range(0, 91): # to close door
            servo.angle = angle
            sleep(0.1)
        counter = 0
        sleep(1)  
    else:
        print("Finger not found")
        counter+=1
        if counter > 2:
            buzzer.on()
            sleep(4)
            buzzer.off()
            counter=0
            sleep(5)
