#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "Starting automated setup for MagInkDash project..."

# --- Step 1: Update package lists and install required system packages ---
echo "Updating system packages and installing dependencies..."
sudo apt update
sudo apt-get install python3-pip chromium-chromedriver libopenjp2-7-dev apache2 -y

# --- Step 2: Install required Python libraries ---
echo "Installing Python libraries using pip..."
pip3 install --upgrade google-api-python-client google-auth-httplib2 google-auth-oauthlib
pip3 install pytz
pip3 install selenium
pip3 install Pillow
pip3 install openai

# --- Step 3: Configure web server permissions for image saving ---
echo "Configuring permissions for Apache web server..."
# Note: You may be prompted for your password for these commands.
sudo chown pi:www-data /var/www/html
sudo chmod 755 /var/www/html

echo "Setup script completed successfully!"