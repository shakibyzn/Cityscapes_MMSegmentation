#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <quality>"
    exit 1
fi

quality="$1"
source_dir="data/leftImg8bit_trainvaltest/leftImg8bit"
target_dir="compressed_${quality}"

# Iterate through train/val/test folders
for split in "train" "val" "test"; do
    source_split_dir="$source_dir/$split"
    target_split_dir="$target_dir/$split"

    # Iterate through subfolders
    for subfolder in "$source_split_dir"/*/; do
        subfolder_name=$(basename "$subfolder")
        target_subfolder="$target_split_dir/$subfolder_name"

        # Create target subfolder if it doesn't exist
        mkdir -p "$target_subfolder"

        # Convert and compress images to JPEG
        for image in "$subfolder"*.png; do
            image_name=$(basename "$image" .png)  # Remove .png extension
            target_image="$target_subfolder/$image_name.jpg"  # Use .jpg extension

            convert -quality "$quality" "$image" "$target_image"
        done
    done
done

echo "Conversion and compression to JPEG complete."
