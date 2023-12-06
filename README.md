# Scripts-Collection
Global scripts collection to be able to be consumed by different clients. Some examples can be from your personal laptop, directly from a server, or via user-data when provisioning a new Ec2 instance.
<br><br>
# Usage
## Standalone Scripts
Here is an example on downloading and running different script to install different component on ubuntu 22.04

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

NOTE: When downloading a new pattern script you'll need to pass the name of the pattern scrip to the run method as seen below.
### Devtools Pattern
The below example uses existing standalone scripts put together in a pattern script to install various installs usuful for developers. 

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

