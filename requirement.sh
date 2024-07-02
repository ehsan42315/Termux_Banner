#!/bin/bash

# Function to display colorful messages
show_message() {
    local message="$1"
    local color="$2"
    echo -e "\033[1m${color}${message}\033[0m"
}

# Function to prompt and read input
prompt_input() {
    local message="$1"
    local varname="$2"
    read -p "$(echo -e "${cyan}\033[1m${message}: ${reset}")" $varname
}

# Clear screen
clear

# Update package repositories
show_message "Updating package repositories..." "\033[0;36m"
apt update

# Upgrade installed packages
show_message "Upgrading installed packages..." "\033[0;36m"
apt upgrade -y

# Install necessary packages
show_message "Installing figlet..." "\033[0;36m"
apt install figlet -y

show_message "Installing toilet..." "\033[0;36m"
apt install toilet -y

show_message "Installing cowsay..." "\033[0;36m"
apt install cowsay -y

show_message "Installing nano..." "\033[0;36m"
apt install nano -y

show_message "Installing ruby..." "\033[0;36m"
apt install ruby -y

show_message "Installing lolcat gem..." "\033[0;36m"
gem install lolcat

# Display completion message
clear
figlet -f big "Basic Installation Done!!!" | lolcat
echo
show_message "Now configuring custom Termux banner and cowsay..." "\033[1;32m"
echo

# Prompt for banner and cowsay names
prompt_input "Enter Your Banner Name" varbanner
prompt_input "Enter Your Cowsay Name" varcowsay

# Generate temporary files for banner and cowsay configurations
echo "cowsay -f eyes \"$varcowsay\" | lolcat" > cowsay_config.txt
echo "toilet -f big \"$varbanner\" -F gay | lolcat" > banner_config.txt
echo "clear" > clear_config.txt

# Update bash.bashrc with banner and cowsay configurations
cat clear_config.txt >> /data/data/com.termux/files/usr/etc/bash.bashrc
cat cowsay_config.txt >> /data/data/com.termux/files/usr/etc/bash.bashrc
cat banner_config.txt >> /data/data/com.termux/files/usr/etc/bash.bashrc

# Clean up temporary files
rm cowsay_config.txt banner_config.txt clear_config.txt

# List files to confirm operation completion
ls

# Final message
echo
show_message "Setup completed successfully. Enjoy your customized Termux experience!" "\033[1;32m"
show_message "Developed by: Muhammad Ehsan" "\033[1;33m"

