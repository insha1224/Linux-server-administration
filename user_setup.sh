#!/bin/bash
# =============================================
# User Setup Script with SSH Key Authentication
# Author: Insha Taj Shaikh
# =============================================

read -p "Enter new username: " USERNAME

# Create user
sudo useradd -m -s /bin/bash $USERNAME
echo "✅ User '$USERNAME' created."

# Create .ssh directory
sudo mkdir -p /home/$USERNAME/.ssh
sudo chmod 700 /home/$USERNAME/.ssh

# Generate SSH key pair
ssh-keygen -t rsa -b 4096 -f /home/$USERNAME/.ssh/id_rsa -N ""
sudo cat /home/$USERNAME/.ssh/id_rsa.pub >> /home/$USERNAME/.ssh/authorized_keys
sudo chmod 600 /home/$USERNAME/.ssh/authorized_keys
sudo chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh

echo "✅ SSH key pair generated for '$USERNAME'."

# Disable password authentication
sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl restart sshd
echo "✅ Password authentication disabled. SSH key login only."

echo ""
echo "Private key saved at: /home/$USERNAME/.ssh/id_rsa"
echo "Share this with the user securely."
