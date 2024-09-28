#!/bin/bash

# Function to compress video
compress_video() {
    local input_video="$1"
    local output_video="${input_video%.*}-compressed.mp4"

    # Extract video metadata
    video_bitrate=$(ffprobe -v error -select_streams v:0 -show_entries stream=bit_rate -of csv=p=0 "$input_video")
    audio_bitrate=$(ffprobe -v error -select_streams a:0 -show_entries stream=bit_rate -of csv=p=0 "$input_video")
    resolution=$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$input_video")
    frame_rate=$(ffprobe -v error -select_streams v:0 -show_entries stream=r_frame_rate -of csv=p=0 "$input_video")

    # Set defaults if metadata is missing
    video_bitrate=${video_bitrate:-"2000k"}
    audio_bitrate=${audio_bitrate:-"128k"}
    resolution=${resolution:-"1920x1080"}
    frame_rate=${frame_rate:-"30"}

    # Compress the video using ffmpeg with the same resolution, bitrate, and audio settings
    ffmpeg -i "$input_video" -vcodec libx264 -crf 18 -preset slow -b:v "$video_bitrate" -r "$frame_rate" -acodec aac -b:a "$audio_bitrate" -vf "scale=$resolution" "$output_video"
}

# Check if folder path is provided
# if [ -z "$1" ]; then
#     echo "Please provide a folder path."
#     exit 1
# fi

# # Folder path
# folder_path="$1"

# Export the function so it can be used in find's -exec
export -f compress_video

# Traverse the specified directory and find all video files, then process them
# find "$folder_path" -type f \( -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.avi" \) | \
find /home/royaltsp2/Documents/torrs/scanned/Niklas\ Pedde\ -\ Instagram\ University\ 3.0\ \[Updated\]\ \(Compress\)/ -type f \( -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.avi" \) | \
    while IFS= read -r file; do
        compress_video "$file"
    done

echo "Compression completed!"
