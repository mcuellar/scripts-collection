#!/bin/bash

logHeader "Updating apt package manager"

logMessage "Starting"
sudo apt update
logMessage "Finished apt update"
