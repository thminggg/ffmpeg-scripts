#!/bin/bash

# Check if the input file is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 input.avi"
    exit 1
fi

# Input and output file names
input_file="$1"
output_file="${input_file%.avi}.mp4"

# Convert AVI to MP4
ffmpeg -i "$input_file" -c:v libx264 -c:a aac -strict experimental -b:a 192k "$output_file"

echo "Conversion complete: $output_file"
