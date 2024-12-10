#!/bin/bash

# This script attempts to process a list of files, but it contains a subtle race condition.
# The race condition occurs when multiple processes try to access and modify the same file simultaneously.

files=("/tmp/file1.txt" "/tmp/file2.txt" "/tmp/file3.txt")

for file in "${files[@]}"; do
  # Create the files if they don't exist
  if [ ! -f "$file" ]; then
    touch "$file"
  fi

  # Race condition: multiple processes might modify the same file concurrently
  echo "Processing: $file" >> "$file"
  sleep 1 # Simulate some processing time
done

# this may be unexpected when you run it multiple times.

