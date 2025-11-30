# Simple Pose Detection using MediaPipe

This project performs **basic human pose detection** on a cricket video using **MediaPipe Pose**.  
The script downloads a YouTube Shorts video, processes each frame, detects the body joints, and draws the skeletal connections.

This project was created as part of a learning assignment, with ** AI-assisted guidance** used for implementation and improvements.

---

## 📌 Features

- Downloads a YouTube Shorts video  - https://youtube.com/shorts/vSX3IRxGnNY
- Detects human pose landmarks  
- Draws:
  - Body joints (keypoints)  
  - Connecting lines (skeleton)  
- Saves the processed video as an MP4 file  
- Uses MediaPipe’s fast and efficient Pose model

---

## 📁 Project Structure

```
custom-object-detection/
│
├── pose_detection_basic.py # Main script
├── cover_drive.mp4 # Downloaded input video (not always uploaded)
├── pose_processed.mp4 # Output video with pose landmarks
├── README.md # Documentation
```


---

## 🛠️ Requirements

The script automatically installs:

- `opencv-python`
- `mediapipe`
- `yt-dlp`
- `numpy`

You can also install them manually:

```bash
pip install opencv-python mediapipe yt-dlp numpy
```

## ▶️ How It Works

- Downloads a YouTube Shorts video using yt-dlp
- Loads the video with OpenCV
- Runs MediaPipe Pose to detect body joints
- Draws:
  - Keypoints
  - Pose connections
- Saves the processed video

---

📷 Output Example

The output video will show:
- White keypoints for every joint
- Lines connecting shoulders, elbows, hips, knees, etc.
- Smooth pose tracking across frames

---
## Running the Script

```
python pose_detection_basic.py
```
Make sure you update the folder paths in the script if needed.

## Notes
- Only basic pose detection is performed.
- No angle calculations or advanced metrics are included.
- This project is intended for learning and practice.

## Created By
Mounika Seelam
