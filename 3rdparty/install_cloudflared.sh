#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: sudo ./install_cloudflared --token <MYTOKEN>"
    echo "       sudo ./install_cloudflared --uninstall"
    exit 1
}

# Check if the script is run with sudo
if [[ "$EUID" -ne 0 ]]; then
    echo "Please run as root (using sudo)"
    usage
fi

# Function to install Cloudflared
install_cloudflared() {
    TOKEN=$1

    # Check if the token is the default placeholder
    if [[ "$TOKEN" == "<MYTOKEN>" ]]; then
        echo "Error: Please replace <MYTOKEN> with your actual token."
        exit 1
    fi

    # Download the cloudflared package
    curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64.deb

    # Install the downloaded package
    sudo dpkg -i cloudflared.deb

    # Install and configure the cloudflared service
    sudo cloudflared service install "$TOKEN"
}

# Function to uninstall Cloudflared
uninstall_cloudflared() {
    # Uninstall the cloudflared service
    sudo cloudflared service uninstall

    # Remove the cloudflared package
    sudo apt-get remove -y cloudflared
    sudo apt-get autoremove -y
}

# Main script logic
if [[ "$#" -eq 2 && "$1" == "--token" ]]; then
    install_cloudflared "$2"
elif [[ "$#" -eq 1 && "$1" == "--uninstall" ]]; then
    uninstall_cloudflared
else
    echo "Error: Missing or incorrect parameters"
    usage
fi
