#!/bin/bash


# Save the current date_time in the $NOW variable
NOW=$(date "+%Y-%m-%d_%H_%M_%S")
# Save the screen resolution in the $SCREEN_RESOLUTION variable
SCREEN_RESOLUTION=$(xdpyinfo | awk '/dimensions/{print $2}')
CAPTURE_DIR=$HOME/Documents/screen_captures/
CAPTURE_FILE="${CAPTURE_DIR}${NOW}_screen_capture.mp4"

# Check if the $CAPTURE_DIR
if [ ! -d "$CAPTURE_DIR" ];
then
    mkdir "$CAPTURE_DIR"
fi

echo "Recording available at: $CAPTURE_FILE"
echo "Press Control + C if you want to stop your capture"

# Change the loglevel if you want to change the verbosity of FFMPEG
# You can add -stats to see the encoding stats
ffmpeg -hide_banner -loglevel warning -re -fflags nobuffer -flags low_delay \
    -probesize 200M -video_size "$SCREEN_RESOLUTION" -f x11grab -i :0.0+0,0 \
    -preset ultrafast -pix_fmt yuv420p "$CAPTURE_FILE"
