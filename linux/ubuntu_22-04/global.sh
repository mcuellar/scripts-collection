#!/bin/bash
function log_header(){
    input=$1
    echo -e "\n******* ${input} *******\n"
}

function log_message(){
    ts=`date '+%Y-%m-%d %H:%M:%S'`
    echo "$ts $1"
}

function save_start_time(){
    # Record the start time
    start_time=$(date +%s)
}

function save_end_time(){
    # Record the start time
    end_time=$(date +%s)
}

function display_elapsed_times(){
    # Calculate the elapsed time in seconds
    elapsed_seconds=$((end_time - start_time))

    # Calculate the elapsed time in minutes
    elapsed_minutes=$((elapsed_seconds / 60))

    # Display the results
    echo "Elapsed Time (seconds): $elapsed_seconds"
    echo "Elapsed Time (minutes): $elapsed_minutes"
}


