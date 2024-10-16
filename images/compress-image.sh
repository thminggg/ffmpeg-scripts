#!/bin/bash

# Check if the input image and output image are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 input_image output_image"
    echo "Example: $0 input.jpg output.jpg"
    exit 1
fi

input_image=$1
output_image=$2

# Use ffmpeg to compress the image
ffmpeg -i "$input_image" -vf "scale=iw*0.5:ih*0.5" -q:v 20 "$output_image"

echo "Image compressed and saved as $output_image."
