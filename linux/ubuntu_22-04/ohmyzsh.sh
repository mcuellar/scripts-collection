#!/bin/bash
# Source global.sh to access internal functions
source global.sh

log_header "Installing ZSH shell"
log_message "Starting"

sudo apt install zsh -y

log_message "Finished ZSH install"

log_header "Installing Oh-My-ZSH"
log_message "Starting"

su ubuntu -c 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'

log_message "Changing default shell to zsh"
chsh -s $(which zsh) ubuntu

log_message "Finished oh-my-zsh install"
