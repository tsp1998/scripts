#!/bin/bash

# Set default path if argument is not provided
dirToScan=${1:-/home}

# Run clamscan command with arguments
sudo clamscan --infected --recursive --remove "$dirToScan"

