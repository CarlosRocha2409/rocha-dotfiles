#!/bin/bash

echo "Updating system first..."
sudo pacman -Syu --noconfirm

echo "Installing official repository packages..."
if [ -f repo_pkglist.txt ]; then
    sudo pacman -S --needed --noconfirm - < repo_pkglist.txt
else
    echo "repo_pkglist.txt not found! Skipping..."
fi

echo "Installing AUR packages..."
if [ -f aur_pkglist.txt ]; then
    yay -S --needed --noconfirm - < aur_pkglist.txt
else
    echo "aur_pkglist.txt not found! Skipping..."
fi

echo "Installation complete!"
