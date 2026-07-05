import os
import urllib.request

import cv2
import mediapipe as mp
from mediapipe.tasks import python
from mediapipe.tasks.python import vision

MODEL_PATH = os.path.join(os.path.dirname(__file__), "hand_landmarker.task")
MODEL_URL = (
    "https://storage.googleapis.com/mediapipe-models/hand_landmarker/"
    "hand_landmarker/float16/1/hand_landmarker.task"
)
CAMERA_INDEX = int(os.environ.get("CAMERA_INDEX", "0"))


def ensure_model():
    if os.path.exists(MODEL_PATH):
        return
    print("Downloading hand model…")
    urllib.request.urlretrieve(MODEL_URL, MODEL_PATH)


def finger_up(tip, pip, landmarks):
    return landmarks[tip].y < landmarks[pip].y


def is_peace(landmarks):
    index_up = finger_up(8, 6, landmarks)
    middle_up = finger_up(12, 10, landmarks)
    ring_up = finger_up(16, 14, landmarks)
    pinky_up = finger_up(20, 18, landmarks)
    return index_up and middle_up and not ring_up and not pinky_up


def main():
    ensure_model()

    options = vision.HandLandmarkerOptions(
        base_options=python.BaseOptions(model_asset_path=MODEL_PATH),
        num_hands=1,
        min_hand_detection_confidence=0.5,
        min_hand_presence_confidence=0.5,
        min_tracking_confidence=0.5,
    )
    detector = vision.HandLandmarker.create_from_options(options)

    cap = cv2.VideoCapture(CAMERA_INDEX)
    if not cap.isOpened():
        raise SystemExit(f"Kamera {CAMERA_INDEX} tidak bisa dibuka.")

    print("Foto Kita Blur — tunjuk ✌️ biar layar blur. ESC untuk keluar.")

    while True:
        success, frame = cap.read()
        if not success:
            break

        frame = cv2.flip(frame, 1)
        rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        mp_image = mp.Image(image_format=mp.ImageFormat.SRGB, data=rgb)
        result = detector.detect(mp_image)

        peace_detected = False
        if result.hand_landmarks:
            for hand_landmarks in result.hand_landmarks:
                if is_peace(hand_landmarks):
                    peace_detected = True
                    break

        if peace_detected:
            frame = cv2.GaussianBlur(frame, (61, 61), 0)
            cv2.putText(
                frame, "foto kita blur ~", (24, 48),
                cv2.FONT_HERSHEY_SIMPLEX, 1.1, (255, 255, 255), 2, cv2.LINE_AA,
            )

        cv2.imshow("Foto Kita Blur", frame)
        if cv2.waitKey(1) & 0xFF == 27:
            break

    cap.release()
    cv2.destroyAllWindows()


if __name__ == "__main__":
    main()