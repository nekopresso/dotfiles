#!/bin/bash
# This script copies files from my home directory into the repository directory

# Copy files
cp -v ~/.bashrc ~/Development/dotfiles/
cp -rv ~/.config/hypr ~/Development/dotfiles/.config
cp -rv ~/.config/ags ~/Development/dotfiles/.config
cp -rv ~/.config/kitty ~/Development/dotfiles/.config
cp -rv ~/.config/fish ~/Development/dotfiles/.config
cp -rv ~/.config/wofi ~/Development/dotfiles/.config
cp -rv ~/.config/micro ~/Development/dotfiles/.config

# Navigate to the dotfiles directory
cd ~/Development/dotfiles

# Check if there are changes
if [ -n "$(git status --porcelain)" ]; then
    # Add changes to git
    git add -A

    # Commit changes
    git commit -m "Automated backup $(date +'%Y-%m-%d %H:%M:%S')"

    # Push changes
    git push origin main
fi
