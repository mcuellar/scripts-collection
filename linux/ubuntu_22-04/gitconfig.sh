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

echo "After download"
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
