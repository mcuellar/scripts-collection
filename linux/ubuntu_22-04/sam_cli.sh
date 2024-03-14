#!/bin/bash

# Source global.sh to access internal functions
source global.sh

SAM_URL=https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-arm64.zip

log_header "AWS SAM CLI Install"
log_message "Starting"

log_message "Downloading awscliv2"
curl "${SAM_URL}" -o "aws-sam-cli-linux-arm64.zip"

log_header "Unzipping awscliv2.zip"
unzip aws-sam-cli-linux-arm64.zip -d sam-installation

log_header "Installing SAM"
sudo ./sam-installation/install

log_header "Validating SAM CLI Install"
sam --version

log_message "Finished AWS SAM CLI Install"
