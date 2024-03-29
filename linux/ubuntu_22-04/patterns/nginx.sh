#!/bin/bash
# This script pattern allows you to install NGINX.  
# It will first update the package manager, then install and run NGINX.
# 
#
# PARAMETERS:
#   NONE
# USAGE:
#   nginx.sh

# Define the base URL for your script repository
SCRIPT_REPO="https://raw.githubusercontent.com/mcuellar/scripts-collection/main/linux/ubuntu_22-04"

# Function to download and execute scripts
function run() {
    local script_name="$1"
    curl -sSL "${SCRIPT_REPO}/${script_name}" -o "${script_name}"  # Save to current directory
    bash "${script_name}" # Execute the downloaded script
}

function download(){
    local script_name="$1"
    curl -sSL "${SCRIPT_REPO}/${script_name}" -o "${script_name}"
    chmod +x ${script_name}
}

# Function to download and source the global script.  This will allow sharing of global.sh functions
function init_global() {
    curl -sSL "${SCRIPT_REPO}/global.sh" -o "global.sh"
    source "global.sh"  # Source the global script
}

# Download and source the global script
init_global

# Record start time
save_start_time

# Update apt package manager
run "apt_update.sh"

# Install apt essentials
run "nginx.sh"

# Record end time
save_end_time

log_header "Total Install Elapsed Times"
display_elapsed_times