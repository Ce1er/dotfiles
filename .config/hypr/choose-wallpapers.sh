#!/bin/bash

rm ~/.config/hypr/current-wallpapers/*

# Ask the user to input words to find, separated by space, and assign to a variable
read -p "Enter include words (separated by space): " -a include_words

# Ask the user to input words to exclude, separated by space, and assign to a variable
read -p "Enter exclude words (separated by space): " -a exclude_words

# Initialize an array to hold the filenames that meet the criteria
valid_files=()

# Loop through each file in the specified directory
for file in ~/Images/.comments/*.xml; do
    include_all=true
    exclude_any=false

    # Read the file content
    content=$(cat "$file")

    # Check if all include words are present
    for word in "${include_words[@]}"; do
        if ! grep -q "$word" <<< "$content"; then
            include_all=false
            break
        fi
    done

    # Check if any exclude word is present
    for word in "${exclude_words[@]}"; do
        if grep -q "$word" <<< "$content"; then
            exclude_any=true
            break
        fi
    done

    # If the file meets the criteria, add the filename (without .xml) to the valid_files array
    if $include_all && ! $exclude_any; then
        filename=$(basename "$file" .xml)
        valid_files+=("$filename")
    fi
done

# Create the symlinks in the target directory
for filename in "${valid_files[@]}"; do
    ln -s ~/Images/"$filename" ~/.config/hypr/current-wallpapers/"$filename"
done

echo "Symlinks created for the following files:"
for filename in "${valid_files[@]}"; do
    echo "$filename"
done
