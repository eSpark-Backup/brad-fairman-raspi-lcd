#!/bin/bash


#sleep 60


#export DISPLAY=:0
#DISPLAY=:0 xhost si:localuser:root
# Grant access to the X server for local connections
#xhost +local:

# Wait for 10 seconds (optional)
# sleep 10

# Apply the xinput command
#sudo xinput set-prop "xwayland-touch:14" "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1

# Revoke the access to X server (optional but recommended for security)
#xhost -local:
#DISPLAY=:0 xhost -si:localuser:root

#exit 0

#!/usr/bin/bash
out_file=/usr/local/bin/touch_service_out.txt

xenv="env DISPLAY=:0 XAUTHORITY=/home/sekure/.Xauthority"

# Log that the script is running
echo running > $out_file

# Delay the execution for 1 second
sleep 1

# Log and modify the mouse button map
#$xenv /usr/bin/xinput get-button-map "$mouse_id" >> $out_file
#$xenv /usr/bin/xinput set-button-map "$mouse_id" 2 3 2 4 5 6 7 1 9
#$xenv /usr/bin/xinput get-button-map "$mouse_id" >> $out_file

# Set the Coordinate Transformation Matrix for the touch device
$xenv /usr/bin/xinput set-prop "xwayland-touch:14" "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1

# Indicate that the operation is finished
echo finished >> $out_file