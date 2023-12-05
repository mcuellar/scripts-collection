#!/bin/bash
# Source global.sh to access internal functions
source global.sh

log_header "Updating apt package manager"
log_message "Starting"

sudo apt update

log_message "Finished apt update"
