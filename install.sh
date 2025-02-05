#!/bin/bash

# Function to display package names for manual installation
print_manual_install() {
    echo "Manual installation required. Install the following packages:"
    echo " - libX11-devel"
    echo " - libXft-devel"
    echo " - libXkbcommon-devel"
    echo " - libXrandr-devel"
    echo " - libXcomposite-devel"
    echo " - libXdamage-devel"
    echo " - xorg-xprop"
    echo " - gcc"
    echo " - rofi"
    echo " - picom"
    echo " - make"
    echo " - xorg-server (or equivalent X server package)"
    echo " - procps (or equivalent)"
}

# Function to install dependencies on Ubuntu/Debian
install_ubuntu_debian() {
    echo "Installing dependencies for Ubuntu/Debian..."
    sudo apt update
    sudo apt install -y \
        libx11-dev \
        libxft-dev \
        rofi \
        picom \
        libxkbcommon-dev \
        libxrandr-dev \
        libxcomposite-dev \
        libxdamage-dev \
        x11-utils \
        gcc \
        make \
        xorg \
        procps
}

# Function to install dependencies on Arch Linux
install_arch() {
    echo "Installing dependencies for Arch Linux..."
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm \
        libx11 \
        rofi \
        picom \
        libxft \
        libxkbcommon \
        libxrandr \
        libxcomposite \
        libxdamage \
        xorg-xprop \
        gcc \
        make \
        xorg-server \
        xorg-xinit \
        procps-ng
}

# Function to install dependencies on Fedora
install_fedora() {
    echo "Installing dependencies for Fedora..."
    sudo dnf install -y \
        libX11-devel \
        rofi \
        picom \
        libXft-devel \
        libXkbcommon-devel \
        libXrandr-devel \
        libXcomposite-devel \
        libXdamage-devel \
        xorg-x11-utils \
        gcc \
        make \
        xorg-x11-server-utils \
        procps-ng
}

# Function to install dependencies on Gentoo
install_gentoo() {
    echo "Installing dependencies for Gentoo..."
    sudo emerge --ask x11-libs/libX11 x11-libs/libXft rofi picom x11-libs/libXkbcommon x11-libs/libXrandr x11-libs/libXcomposite x11-libs/libXdamage x11-apps/xorg-xprop dev-lang/gcc sys-apps/procps
}

# Function to install dependencies on Void Linux
install_void() {
    echo "Installing dependencies for Void Linux..."
    sudo xbps-install -Syu
    sudo xbps-install -y \
        libX11-devel \
        rofi \
        picom \
        libXft-devel \
        libXkbcommon-devel \
        libXrandr-devel \
        libXcomposite-devel \
        libXdamage-devel \
        xorg-xprop \
        gcc \
        make \
        procps
}

# Function to install dependencies based on distribution
install_dependencies() {
    if [[ -f /etc/os-release ]]; then
        # Check the distribution
        if grep -q -i "ubuntu\|debian" /etc/os-release; then
            install_ubuntu_debian
        elif grep -q -i "arch" /etc/os-release; then
            install_arch
        elif grep -q -i "fedora" /etc/os-release; then
            install_fedora
        elif grep -q -i "gentoo" /etc/os-release; then
            install_gentoo
        elif grep -q -i "void" /etc/os-release; then
            install_void
        else
            echo "Unknown distribution."
            print_manual_install
            exit 1
        fi
    else
        echo "Could not determine the distribution."
        print_manual_install
        exit 1
    fi
}

# Define the repository URL
REPO_URL="https://github.com/user7210unix/dwm-black"

# Clone the repository
git clone "$REPO_URL" ~/dwm-black

# Change to the repository directory
cd ~/dwm-black || { echo "Failed to enter dwm-black directory"; exit 1; }

# Install dwm
echo "Installing dwm..."
cd dwm || { echo "Failed to enter dwm directory"; exit 1; }
sudo make clean install || { echo "Failed to install dwm"; exit 1; }
cd ..

# Install st
echo "Installing st..."
cd st || { echo "Failed to enter st directory"; exit 1; }
sudo make clean install || { echo "Failed to install st"; exit 1; }
cd ..

# Install slstatus
echo "Installing slstatus..."
cd slstatus || { echo "Failed to enter slstatus directory"; exit 1; }
sudo make clean install || { echo "Failed to install slstatus"; exit 1; }
cd ..

# Handle .xinitrc
if [ -f .xinitrc ]; then
  echo "Copying .xinitrc to home directory..."
  cp .xinitrc ~/
else
  echo ".xinitrc not found, skipping."
fi


# Copy config folder to the .config home directory
if [ -d config ]; then
  echo "Copying config folder to ~/.config..."
  mkdir -p ~/.config
  cp -r fish/* ~/.config/
else
  echo "config folder not found, skipping."
fi

# Copy config folder to the .config home directory
if [ -d config ]; then
  echo "Copying config folder to ~/.config..."
  mkdir -p ~/.config
  cp -r rofi/* ~/.config/
else
  echo "config folder not found, skipping."
fi

# Copy config folder to the .config home directory
if [ -d config ]; then
  echo "Copying config folder to ~/.config..."
  mkdir -p ~/.config
  cp -r picom/* ~/.config/
else
  echo "config folder not found, skipping."
fi

# Download and install JetBrains Nerd Font
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip"
FONT_DIR=~/.fonts

# Create fonts directory if it doesn't exist
mkdir -p "$FONT_DIR"

echo "Downloading JetBrains Nerd Font..."
wget -q "$FONT_URL" -O "$FONT_DIR/JetBrainsMono.zip" || { echo "Failed to download JetBrainsMono.zip"; exit 1; }

# Unzip the font into the fonts directory
unzip -o "$FONT_DIR/JetBrainsMono.zip" -d "$FONT_DIR" || { echo "Failed to unzip JetBrainsMono.zip"; exit 1; }
rm "$FONT_DIR/JetBrainsMono.zip" # Clean up zip file

# Update font cache
echo "Updating font cache..."
fc-cache -vf || { echo "Failed to update font cache"; exit 1; }

# Completion message
echo "Installation complete."
