# Scripts-Collection
Global scripts collection is a set of OS specific set of scripts that can be consumed by different clients. 

These scripts can be called from your personal laptop, directly from a server, or via user-data when provisioning a new Ec2 instance.
<br><br>
# Usage
## Standalone Scripts
Here is an example on downloading and running different scripts to install different component on ubuntu 22.04

Ubuntu 22.04 Scripts List: https://github.com/mcuellar/scripts-collection/tree/main/linux/ubuntu_22-04


```bash
#!/bin/bash

# Define the base URL for your script repository
SCRIPT_REPO="https://raw.githubusercontent.com/mcuellar/scripts-collection/main/linux/ubuntu_22-04"

# Function to download and execute scripts
function run() {
    local script_name="$1"
    curl -sSL "${SCRIPT_REPO}/${script_name}" -o "${script_name}"  # Save to current directory
    bash "${script_name}"  # Execute the downloaded script
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
run "curl_unzip.sh"

# Install oh-my-zsh
run "ohmyzsh.sh"

# Record end time
save_end_time

log_header "Total Install Elapsed Times"
display_elapsed_times
```

## Patterns
### Ubuntu Patterns URL
https://github.com/mcuellar/scripts-collection/tree/main/linux/ubuntu_22-04/patterns

NOTE: When downloading a new pattern script, you'll need to pass the name of the pattern script to the run method as seen below.
### Devtools Pattern
The below example uses existing standalone scripts put together in a pattern script to install various installs at once. You may click directly on a pattern script to look at the details of what it will install. 

```bash
#!/bin/bash
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

# Define the base URL for your script repository
SCRIPT_REPO="https://raw.githubusercontent.com/mcuellar/scripts-collection/main/linux/ubuntu_22-04/patterns"

# Function to download and execute scripts
function run() {
    local script_name="$1"
    curl -sSL "${SCRIPT_REPO}/${script_name}" -o "${script_name}"  # Save to current directory
    bash "${script_name}"  # Execute the downloaded script
}

run "devtools.sh"

```

