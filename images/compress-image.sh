#!/bin/bash

# Check if the input image and output image are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 input_image output_image"
    exit 1
fi

input_image="$1"
output_image="$2"

# Use ffmpeg to compress the image
ffmpeg -i "$input_image" -vf "scale=iw*0.5:ih*0.5" -q:v 20 "$output_image"
base64_output=$(cat "$output_image" | base64)

echo "Image compressed and saved as $output_image"
echo "Image compressed and saved as base64::$base64_output"
