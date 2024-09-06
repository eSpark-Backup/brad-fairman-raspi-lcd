#!/bin/bash

LIGHTDM_CONF="/etc/lightdm/lightdm.conf"

# Check if lightdm.conf exists
if [ -f "$LIGHTDM_CONF" ]; then
    echo "Checking current LightDM configuration..."

    # Check if the system is already using Wayland
    if grep -q 'greeter-session=pi-greeter-wayfire' "$LIGHTDM_CONF" && \
       grep -q 'user-session=LXDE-pi-wayfire' "$LIGHTDM_CONF" && \
       grep -q 'autologin-session=LXDE-pi-wayfire' "$LIGHTDM_CONF"; then
        echo "The system is already using Wayland. No changes necessary."
    else
        echo "Modifying LightDM configuration to switch from X11 to Wayland..."

        # Backup the original lightdm.conf file
        sudo cp "$LIGHTDM_CONF" "${LIGHTDM_CONF}.bak"

        # Replace the greeter-session, user-session, and autologin-session
        sudo sed -i 's/greeter-session=pi-greeter/greeter-session=pi-greeter-wayfire/' "$LIGHTDM_CONF"
        sudo sed -i 's/user-session=LXDE-pi-x/user-session=LXDE-pi-wayfire/' "$LIGHTDM_CONF"
        sudo sed -i 's/autologin-session=LXDE-pi-x/autologin-session=LXDE-pi-wayfire/' "$LIGHTDM_CONF"

        echo "LightDM configuration updated successfully."
    fi
else
    echo "LightDM configuration file not found. Please ensure LightDM is installed."
fi
