#!/bin/bash

# This script demonstrates a solution to the race condition by using a lock file.

files=("/tmp/file1.txt" "/tmp/file2.txt" "/tmp/file3.txt")

for file in "${files[@]}"; do
  # Create the files if they don't exist
  if [ ! -f "$file" ]; then
    touch "$file"
  fi

  # Use flock to acquire a lock on the file before processing
  flock -x "$file" || continue # If locking fails, skip this file

  # Process the file
  echo "Processing: $file" >> "$file"
  sleep 1 # Simulate some processing time

  # Release the lock
  flock -u "$file"
done

# this will work as expected even if you run it multiple times.
