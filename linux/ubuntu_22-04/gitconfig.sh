#!/bin/bash

# Source global.sh to access internal functions
source global.sh

# Check if all required parameters are provided
if [ "$#" -ne 3 ]; then
    log_message "Usage: $0 <user> <name> <email>"
    exit 1
fi

# Assign parameters to variables
user=$1
name=$2
email=$3

# Set the GitHub URL for the .gitconfig.template file
# github_url="https://raw.githubusercontent.com/your_username/your_repository/main/.gitconfig.template"
TEMPLATES_URL=https://raw.githubusercontent.com/mcuellar/scripts-collection/main/linux/ubuntu_22-04/templates/


# Function to download and execute scripts
function download() {
    local template="$1"
    curl -s "${TEMPLATES_URL}/${template}"  # Save to current directory
}


# Download .gitconfig.template from GitHub
gitconfig_template=$(download "gitconfig.tmpl")

# Check if the download was successful
if [ -z "$gitconfig_template" ]; then
    log_message "Error: Unable to download gitconfig.tmpl."
    exit 1
fi

# Update the template file with the provided name and email
gitconfig_template=$(echo "$gitconfig_template" | sed "s/{{NAME}}/$name/g; s/{{EMAIL}}/$email/g")

# Set the output path to /home/$user
output_path="/home/$user"

# Save the updated .gitconfig file
log_message "$gitconfig_template" > "$output_path/.gitconfig"
log_message "Updated .gitconfig file saved successfully to $output_path/.gitconfig."
