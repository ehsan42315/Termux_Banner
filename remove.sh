#!/bin/bash

# Function to display messages in bold and colored text
show_message() {
    local message="$1"
    local color="$2"
    echo -e "\033[1m${color}${message}\033[0m"
}

# Function to remove the folder if it exists
folder_remove() {
    local folder_name="Termux-Banner"
    if [[ -d "$HOME/$folder_name" ]]; then
        show_message "Removing existing $folder_name folder..." "\033[0;36m"
        rm -rvf "$HOME/$folder_name"
    else
        show_message "$folder_name folder not found. Skipping removal." "\033[0;36m"
    fi
}

# Function to install configurations
install() {
    local termux_dir="/data/data/com.termux/files/usr/etc"
    local command_not_found_script="/data/data/com.termux/files/usr/libexec/termux/command-not-found"
    
    show_message "Installing configurations..." "\033[0;36m"

    # Configure zshrc
    if [ -x "$command_not_found_script" ]; then
        echo "if [ -x $command_not_found_script ]; then" > "$termux_dir/zshrc"
        echo "    command_not_found_handle() {" >> "$termux_dir/zshrc"
        echo "        $command_not_found_script \"\$1\"" >> "$termux_dir/zshrc"
        echo "    }" >> "$termux_dir/zshrc"
    fi
    echo "PS1='\$ '" >> "$termux_dir/zshrc"

    # Configure bash.bashrc
    if [ -x "$command_not_found_script" ]; then
        echo "if [ -x $command_not_found_script ]; then" > "$termux_dir/bash.bashrc"
        echo "    command_not_found_handle() {" >> "$termux_dir/bash.bashrc"
        echo "        $command_not_found_script \"\$1\"" >> "$termux_dir/bash.bashrc"
        echo "    }" >> "$termux_dir/bash.bashrc"
    fi
    echo "PS1='\$ '" >> "$termux_dir/bash.bashrc"

    show_message "Configurations installed successfully." "\033[0;32m"
}

# Execute functions
clear
folder_remove
install

# Display completion message
show_message "Setup completed. Enjoy your Termux environment!" "\033[1;32m"
show_message "Developed by: Muhammad Ehsan" "\033[1;33m"

