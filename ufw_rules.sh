#!/bin/bash
# =============================================
# UFW Firewall Configuration Script
# Author: Insha Taj Shaikh
# =============================================

echo "Setting up UFW Firewall rules..."

# Reset UFW to default
sudo ufw --force reset

# Default policies
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow SSH (port 22)
sudo ufw allow 22/tcp
echo "✅ SSH (port 22) allowed"

# Allow HTTP (port 80)
sudo ufw allow 80/tcp
echo "✅ HTTP (port 80) allowed"

# Allow HTTPS (port 443)
sudo ufw allow 443/tcp
echo "✅ HTTPS (port 443) allowed"

# Enable UFW
sudo ufw --force enable

echo ""
sudo ufw status verbose
echo ""
echo "✅ Firewall configured successfully!"
