# Basic Pose Detection using MediaPipe
# Created by: Mounika Seelam
# Purpose: Show pose landmarks (joints + connecting lines) on a video

!pip install --quiet opencv-python mediapipe yt-dlp

import cv2
import mediapipe as mp
import os

# =============================
# File Paths
# =============================
drive_folder = "/content/drive/MyDrive/Assignments/AthleteRise_ComputerVision_Assignment_15082025"
shorts_url = "https://youtube.com/shorts/vSX3IRxGnNY"

input_video = f"{drive_folder}/cover_drive.mp4"
output_video = f"{drive_folder}/pose_processed.mp4"

# =============================
# Download Video
# =============================
!yt-dlp -f "mp4" -o "{input_video}" "{shorts_url}"

if not os.path.exists(input_video):
    raise FileNotFoundError("Video download failed!")

print(f"Video downloaded: {input_video}")

# =============================
# Pose Detection
# =============================
mp_pose = mp.solutions.pose
mp_drawing = mp.solutions.drawing_utils

cap = cv2.VideoCapture(input_video)
fps = int(cap.get(cv2.CAP_PROP_FPS))
width  = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))

fourcc = cv2.VideoWriter_fourcc(*'mp4v')
out = cv2.VideoWriter(output_video, fourcc, fps, (width, height))

pose = mp_pose.Pose(
    static_image_mode=False,
    min_detection_confidence=0.5,
    min_tracking_confidence=0.5
)

print("Processing video...")

while cap.isOpened():
    ret, frame = cap.read()
    if not ret:
        break

    rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
    results = pose.process(rgb)

    # Draw only pose landmarks and connections
    if results.pose_landmarks:
        mp_drawing.draw_landmarks(
            frame,
            results.pose_landmarks,
            mp_pose.POSE_CONNECTIONS
        )

    out.write(frame)

cap.release()
out.release()
pose.close()

print(f"Pose processed video saved at: {output_video}")
