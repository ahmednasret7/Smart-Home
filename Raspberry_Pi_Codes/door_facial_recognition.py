import face_recognition
import cv2
import numpy as np
import os
from time import sleep
from flask import Flask, render_template, Response, request
from gpiozero import AngularServo
import threading
# import webbrowser
# Store objects in array
known_person = []  # Name of person string
known_image = []  # Image object
known_face_encodings = []  # Encoding object

# Initialize some variables for facial recognition
face_locations = []
face_encodings = []
face_names = []
process_this_frame = True

# Loop to add images in the "profiles" folder
for file in os.listdir("profiles"):
    try:
        # Extract person name from the image filename eg: david.jpg
        known_person.append(file.replace(".jpg", ""))
        file = os.path.join("profiles/", file)
        known_image = face_recognition.load_image_file(file)
        known_face_encodings.append(face_recognition.face_encodings(known_image)[0])
    except Exception as e:
        pass


servo_lock = threading.Lock()
def servo():
    servo = AngularServo(18,initial_angle=90, min_pulse_width=0.0006, max_pulse_width=0.0023)  
    for angle in range(90, -1,-1): # to open door 
        servo.angle = angle
        sleep(0.1) 
    sleep(5)  # Wait for x seconds
    for angle in range(0, 91): # to close door
        servo.angle = angle
        sleep(0.1)
    sleep(1)  

class VideoCamera(object):
    def __init__(self):
        self.video = cv2.VideoCapture(0)
        self.servo_thread = None
    def __del__(self):
        self.video.release()

    def get_frame(self):
        global process_this_frame
        global face_locations
        success, image = self.video.read()

        # Resize frame of video to 1/4 size for faster face recognition processing
        small_frame = cv2.resize(image, (0, 0), fx=0.25, fy=0.25)

        # Convert the image from BGR color (which OpenCV uses) to RGB color (which face_recognition uses)
        rgb_small_frame = small_frame[:, :, ::-1]

        # Only process every other frame of video to save time
        if process_this_frame:
            # Find all the faces and face encodings in the current frame of video
            face_locations = face_recognition.face_locations(rgb_small_frame)
            face_encodings = face_recognition.face_encodings(rgb_small_frame, face_locations)

            for face_encoding in face_encodings:
                # See if the face is a match for the known face(s)
                matches = face_recognition.compare_faces(known_face_encodings, face_encoding)
                name = "Unknown"

                face_distances = face_recognition.face_distance(known_face_encodings, face_encoding)
                best_match_index = np.argmin(face_distances)
                if matches[best_match_index]:
                    name = known_person[best_match_index]
                    # move the servo
                    # if servo_lock.acquire(blocking=False):
                    #     threading.Thread(target=servo).start()
                    if self.servo_thread is None or not self.servo_thread.is_alive():
                        self.servo_thread = threading.Thread(target=servo)
                        self.servo_thread.start()
                    # servo()
                face_names.append(name)

        process_this_frame = not process_this_frame

        # Display the results
        for (top, right, bottom, left), name in zip(face_locations, face_names):
            # Scale back up face locations since the frame we detected in was scaled to 1/4 size
            top *= 4
            right *= 4
            bottom *= 4
            left *= 4

            # Draw a box around the face
            cv2.rectangle(image, (left, top), (right, bottom), (255, 255, 255), 2)

            # Draw a label with a name below the face
            cv2.rectangle(image, (left, bottom - 35), (right, bottom), (255, 255, 255), cv2.FILLED)
            font = cv2.FONT_HERSHEY_DUPLEX
            cv2.putText(image, name, (left + 10, bottom - 10), font, 1.0, (0, 0, 0), 1)

        ret, jpeg = cv2.imencode('.jpg', image)
        return jpeg.tobytes()


# Flask web server code...

app = Flask(__name__)

# ...
@app.route('/', methods=['GET', 'POST'])
def move():
    result = ""
    if request.method == 'POST':
        return render_template('index.html', res_str=result)
                        
    return render_template('index.html')


def gen(camera):
    while True:
        frame = camera.get_frame()
        yield (b'--frame\r\n'
               b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n\r\n')

@app.route('/video_feed')
def video_feed():
    return Response(gen(VideoCamera()),
                    mimetype='multipart/x-mixed-replace; boundary=frame')
# threading.Timer(60, lambda: webbrowser.open("http://localhost:5000")).start()
if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True, threaded=True)
