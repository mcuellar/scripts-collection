#!/bin/bash

# Source global.sh to access internal functions
source global.sh

log_header "Starting AWSCLIV2 Install"
log_message "Started"

log_message "Downloading awscliv2"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

log_header "Unzipping awscliv2.zip"
unzip awscliv2.zip

log_header "Installing awscliv2"
sudo ./aws/install

log_header "Validating AWSCLI Install"
aws --version

log_message "Finished AWSCLIV2 Install"
