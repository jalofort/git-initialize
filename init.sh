#!/bin/bash

# set Asia/Riyadh timezone
sudo timedatectl set-timezone Asia/Riyadh

# Update the package list
echo "Updating package list..."
sudo apt update

# Install Git
echo "Installing Git..."
sudo apt install -y git

# Verify the installation
echo "Verifying Git installation..."
git --version

# Confirm the installation
if [ $? -eq 0 ]; then
  echo "Git has been successfully installed!"
else
  echo "There was an error installing Git."
fi

# Prompt for email
read -p "Enter your GitHub email address: " email

# Generate the SSH key
echo "Generating SSH key..."
ssh-keygen -t ed25519 -C "$email" -f ~/.ssh/id_ed25519_github -N ""

# Copy ssh config file
echo "Copying ssh config file..."
cp ssh_config ~/.ssh/config

# Display the SSH key
echo "Here is your SSH public key:"
cat ~/.ssh/id_ed25519_github.pub

# Instructions to add the key to GitHub
echo ""
echo "Copy the above SSH key and add it to your GitHub account by following these steps:"
echo "1. Go to https://github.com/settings/keys"
echo "2. Click on 'New SSH key'"
echo "3. Paste the SSH key and give it a descriptive title"
echo "4. Click 'Add SSH key'"

# Confirm completion
echo "SSH key generation and setup complete!"