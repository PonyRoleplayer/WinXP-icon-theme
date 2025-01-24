#!/bin/bash

# Script to resize all .png files in the current directory to a specified size

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <size>"
    echo "Example: $0 8x8"
    exit 1
fi

# Extract the size parameter from the first argument
SIZE="$1"

# Check if the 'convert' command (from ImageMagick) is available
if ! command -v convert &> /dev/null; then
    echo "Error: ImageMagick 'convert' command is not installed. Please install it and try again."
    exit 1
fi

# Use 'find' to locate all .png files (case-insensitive) and resize them
find . -iname "*.png" -exec convert {} -resize "$SIZE" {} \;

echo "Resizing of .png files to $SIZE is complete."
