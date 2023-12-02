#!/bin/bash
# Source global.sh to access internal functions
source global.sh

# Unzip and Curl installs
log_header "Installing unzip and curl"
log_message "Starting essentials install."

sudo apt -y install unzip curl

log_message "Finished essentials install."

# JQ install
log_header "Installing JQ"
log_message "Starting"

sudo apt install -y jq

log_message "Finished JQ install"
