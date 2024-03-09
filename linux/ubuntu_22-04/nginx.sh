#!/bin/bash
# Source global.sh to access internal functions
source global.sh

# Unzip and Curl installs
log_header "Installing NGINX"
log_message "Starting install."

# Update package index
# sudo apt-get update

# Install nginx
sudo apt-get install nginx -y

# Start nginx
log_message "Starting NGINX"
sudo systemctl start nginx

# Enable nginx to start on boot
log_message "Enabling NGINX"
sudo systemctl enable nginx

# Output Nginx status
log_message "Checking NGINX status"
sudo systemctl status nginx

log_message "Finished NGINX install"
