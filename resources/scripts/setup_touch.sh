#!/bin/bash
echo "Setting up touch configuration service..."

# Create the touch_cal.sh script
sudo bash -c "cat > /usr/local/bin/touch_cal.sh" << 'EOF'
#!/usr/bin/bash
out_file=/usr/local/bin/touch_service_out.txt
xenv="env DISPLAY=:0 XAUTHORITY=/home/sekure/.Xauthority"

# Log that the script is running
echo running > $out_file

# Delay the execution for 1 second
sleep 1

# Set the Coordinate Transformation Matrix for the touch device
$xenv /usr/bin/xinput set-prop "xwayland-touch:14" "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1

# Indicate that the operation is finished
echo finished >> $out_file
EOF

# Set the permissions for the script
sudo chmod +x /usr/local/bin/touch_cal.sh

# Create the systemd service file
sudo bash -c "cat > /etc/systemd/system/invert_touchscreen.service" << EOF
[Unit]
Description=Invert Goodix Touchscreen XY Mapping
After=graphical.target

[Service]
Type=forking
ExecStart=/usr/local/bin/touch_cal.sh
Restart=on-failure
# User=$USER
# Environment=DISPLAY=:0
# Environment=XAUTHORITY=/home/$USER/.Xauthority

[Install]
WantedBy=multi-user.target
EOF

# Enable and start the service
sudo systemctl enable invert_touchscreen
sudo systemctl start invert_touchscreen

echo "Touch configuration setup complete."
