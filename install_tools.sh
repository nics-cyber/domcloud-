#!/bin/bash

# Function to install a repository locally
install_repo() {
    local repo_url="$1"
    local repo_name="$2"
    echo "Installing $repo_name locally..."
    if [[ -d ~/"$repo_name" ]]; then
        echo "Directory ~/$repo_name already exists. Skipping clone."
    else
        git clone "$repo_url" ~/"$repo_name"
    fi
    if [[ -f ~/"$repo_name"/install.sh ]]; then
        echo "Running install.sh for $repo_name..."
        chmod +x ~/"$repo_name"/install.sh
        cd ~/"$repo_name"
        ./install.sh
        cd ~
    else
        echo "No install.sh found in $repo_name. Skipping installation script."
    fi
}

# Install FoxTools
install_repo "https://github.com/foxytouxxx/FoxTools.git" "FoxTools"

# Install freeroot (katy-the-kat)
install_repo "https://github.com/katy-the-kat/freeroot.git" "freeroot-katy"

# Install freeroot (Mytai20100)
install_repo "https://github.com/Mytai20100/freeroot.git" "freeroot-mytai"

# Install freeroot-all-installer (nics-cyber)
install_repo "https://github.com/nics-cyber/freeroot-all-installer.git" "freeroot-all-installer"

# Create a local sources.list for personal use
echo "Creating a local sources.list for personal use..."
mkdir -p ~/.local/apt
echo "deb [trusted=yes] http://ports.ubuntu.com/ubuntu-ports/ jammy main restricted
deb [trusted=yes] http://ports.ubuntu.com/ubuntu-ports/ jammy-updates main restricted
deb [trusted=yes] http://ports.ubuntu.com/ubuntu-ports/ jammy universe
deb [trusted=yes] http://ports.ubuntu.com/ubuntu-ports/ jammy-updates universe
deb [trusted=yes] http://ports.ubuntu.com/ubuntu-ports/ jammy multiverse
deb [trusted=yes] http://ports.ubuntu.com/ubuntu-ports/ jammy-updates multiverse
deb [trusted=yes] http://ports.ubuntu.com/ubuntu-ports/ jammy-backports main restricted universe multiverse
deb [trusted=yes] http://ports.ubuntu.com/ubuntu-ports/ jammy-security main restricted
deb [trusted=yes] http://ports.ubuntu.com/ubuntu-ports/ jammy-security universe
deb [trusted=yes] http://ports.ubuntu.com/ubuntu-ports/ jammy-security multiverse" > ~/.local/apt/sources.list

# Update environment to use local sources.list
export APT_CONFIG=$HOME/.local/apt/sources.list

# Feature: Let users choose which tools to install
echo "Which tools would you like to install?"
echo "1. FoxTools"
echo "2. freeroot (katy-the-kat)"
echo "3. freeroot (Mytai20100)"
echo "4. freeroot-all-installer (nics-cyber)"
echo "5. All of the above"
read -p "Enter your choice (1-5): " choice

case $choice in
    1)
        install_repo "https://github.com/foxytouxxx/FoxTools.git" "FoxTools"
        ;;
    2)
        install_repo "https://github.com/katy-the-kat/freeroot.git" "freeroot-katy"
        ;;
    3)
        install_repo "https://github.com/Mytai20100/freeroot.git" "freeroot-mytai"
        ;;
    4)
        install_repo "https://github.com/nics-cyber/freeroot-all-installer.git" "freeroot-all-installer"
        ;;
    5)
        install_repo "https://github.com/foxytouxxx/FoxTools.git" "FoxTools"
        install_repo "https://github.com/katy-the-kat/freeroot.git" "freeroot-katy"
        install_repo "https://github.com/Mytai20100/freeroot.git" "freeroot-mytai"
        install_repo "https://github.com/nics-cyber/freeroot-all-installer.git" "freeroot-all-installer"
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

# Install Vps-Bot (only if chosen)
if [[ $choice -eq 3 || $choice -eq 5 ]]; then
    echo "Installing Vps-Bot..."
    install_repo "https://github.com/foxytouxxx/Vps-Bot.git" "Vps-Bot"
    read -p "Enter your bot token: " bot_token
    read -p "Enter any other required configuration for Vps-Bot: " bot_config
    echo "Bot token and configuration set for Vps-Bot."
fi

echo "Script completed successfully!"
