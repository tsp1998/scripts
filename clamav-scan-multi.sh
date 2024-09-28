#!/bin/bash

# Set default directories if no arguments are provided
dirsToScan=("$@")
if [ ${#dirsToScan[@]} -eq 0 ]; then
  dirsToScan=("/home")
fi

# Run clamscan command with arguments
for dir in "${dirsToScan[@]}"; do
  sudo clamscan --infected --recursive --remove "$dir"
done
