#!/bin/bash

# Path to the folder containing the Bash scripts
scripts_folder="/home/royaltsp/tsp/scripts/sample-scripts"

# Infinite loop
while true; do
    # Loop through all Bash scripts in the folder
    for script_file in "$scripts_folder"/*.sh; do
        script_name=$(basename "$script_file")
        log_file="${script_file}.log"

        # Execute the script and redirect output to the log file
        echo "Executing script: $script_name"
        # bash "$script_file" >> "$log_file" 2>&1

        echo "Script execution completed. Log file: $log_file"
    done

    # Pause for 2 seconds
    sleep 2
done
