#!/bin/bash
# This script allows you to configure your home .gitconfig file with your name and email. 
# This is needed when setting a new server or laptop to be able to contribute to git repositories
#
# PREREQUISITES:
#   - Git Installed
# PARAMETERS:
#   user: Name of system user to install .gitconfig under. 
#   name: First and Last Name for your git commits
#   email: Email address for your git commits
# USAGE:
#   gitconfig.sh <user> <name> <email>


# Assign parameters to variables
user=$1
name=$2
email=$3

# Source global.sh to access internal functions
source global.sh

# Check if all required parameters are provided
if [ "$#" -ne 3 ]; then
    log_message "Usage: $0 <user> <name> <email>"
    exit 1
fi

# Set URL for .gitconfig.template file
TEMPLATES_URL=https://raw.githubusercontent.com/mcuellar/scripts-collection/main/linux/ubuntu_22-04/templates/

# Function to download and execute scripts
function download() {
    local template="$1"
    curl -sSL "${TEMPLATES_URL}/${template}" -o ${template}  # Save to current directory
}

# Set the output path to /home/$user
output_path="/home/$user/.gitconfig"

# Download .gitconfig.template
download gitconfig.tmpl

# Check if the download was successful
if [ -z "gitconfig.tmpl" ]; then
    log_message "Error: Unable to download gitconfig.tmpl."
    exit 1
fi

log_message "Reading templatest to validate download."
cat gitconfig.tmpl

# Search and replace
sed -i "s/{{NAME}}/$name/" gitconfig.tmpl
sed -i "s/{{EMAIL}}/$email/" gitconfig.tmpl

log_message "Saving new gitconfig file to: $output_path"
cat gitconfig.tmpl > $output_path

log_message "Final gitconfig output"
cat $output_path

# Save the updated .gitconfig file
log_message "Updated .gitconfig file saved successfully to $output_path"
