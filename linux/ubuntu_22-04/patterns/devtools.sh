#!/bin/bash
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

# Define the base URL for your script repository
SCRIPT_REPO="https://raw.githubusercontent.com/mcuellar/scripts-collection/main/linux/ubuntu_22-04"

# Function to download and execute scripts
function download_and_execute() {
    local script_name="$1"
    curl -sSL "${SCRIPT_REPO}/${script_name}" -o "${script_name}"  # Save to current directory
    bash "${script_name}"  # Execute the downloaded script
}

# Function to download and source the global script.  This will allow sharing of global.sh functions
function download_and_source_global() {
    curl -sSL "${SCRIPT_REPO}/global.sh" -o "global.sh"
    source "global.sh"  # Source the global script
}

# Download and source the global script
download_and_source_global

# Record start time
save_start_time

# Update apt package manager
download_and_execute "update_apt_manager.sh"

# Install apt essentials
download_and_execute "install_curl_unzip.sh"

# Install oh-my-zsh
download_and_execute "install_ohmyzsh.sh"

# Record end time
save_end_time

log_header "Total Install Elapsed Times"
display_elapsed_times