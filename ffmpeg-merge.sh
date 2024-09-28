#!/bin/bash

# Directory containing the video segments
dir="/home/royaltsp/Public/1"

# Change to the directory containing the video segments
cd "$dir"

# Create a list file
for f in $(ls -v *.mp4); do echo "file '$f'" >> mylist.txt; done

# Merge the videos
ffmpeg -f concat -safe 0 -i mylist.txt -c copy output.mp4

# Remove the list file
rm mylist.txt

echo "Merging completed. The output file is 'output.mp4'."

