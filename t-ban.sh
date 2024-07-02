#!/bin/bash

# Colors for text formatting
cyan='\033[0;36m'
lightgreen='\033[1;32m'
yellow='\033[1;33m'
red='\033[1;31m'
reset='\033[0m' # reset color

# Function to display banner
show_banner() {
    echo -e "${lightgreen}\033[1mSecurity Help For Ethical Hackers... "
    echo -e "${yellow}\033[1m               -Muhammad Ehsan"
    echo -e "${reset}"
}

# Function to prompt and read input
prompt_input() {
    local message="$1"
    local varname="$2"
    read -p "$(echo -e "${cyan}\033[1m${message}: ${reset}")" $varname
}

# Main script execution
clear

# Display the banner
show_banner

# Prompt for banner and cowsay names
prompt_input "What is Your Banner Name" varbanner
prompt_input "What is Your Cowsay Name" varcowsay

# Generate temporary files
echo "cowsay -f eyes \"$varcowsay\" | lolcat" > cowsay_config.txt
echo "toilet -f big \"$varbanner\" -F gay | lolcat" > banner_config.txt
echo "clear" > clear_config.txt

# Update bash.bashrc
cat clear_config.txt >> /data/data/com.termux/files/usr/etc/bash.bashrc
cat cowsay_config.txt >> /data/data/com.termux/files/usr/etc/bash.bashrc
cat banner_config.txt >> /data/data/com.termux/files/usr/etc/bash.bashrc

# Clean up temporary files
rm cowsay_config.txt banner_config.txt clear_config.txt

# List files to confirm operation completion
ls

echo -e "${lightgreen}\033[1mSetup completed successfully. Enjoy your customized Termux experience!${reset}"

