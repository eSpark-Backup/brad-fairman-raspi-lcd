#!/bin/bash
echo "Setting up touch configuration service..."

cur_dir="$( cd "$(dirname "$0")" ; pwd -P )"

# Copy the touch_cal.sh script from the repo to /usr/local/bin
sudo cp ${cur_dir}/../scripts/touch/touch_cal.sh /usr/local/bin/touch_cal.sh

# Set the permissions for the script
sudo chmod +x /usr/local/bin/touch_cal.sh

# Copy the invert_touchscreen.service from the repo to /etc/systemd/system/
sudo cp ${cur_dir}/../scripts/touch/invert_touchscreen.service /etc/systemd/system/invert_touchscreen.service

# Enable and start the service
sudo systemctl enable invert_touchscreen
sudo systemctl start invert_touchscreen

echo "Touch configuration setup complete."
