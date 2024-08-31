#!/usr/bin/bash

xenv="env DISPLAY=:0 XAUTHORITY=/home/$USER/.Xauthority"

echo $USER

$xenv xrandr --output DSI-1 --rotate left
$xenv xinput set-prop "pointer:1-0014 Goodix Capacitive TouchScreen" "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1

exit 0