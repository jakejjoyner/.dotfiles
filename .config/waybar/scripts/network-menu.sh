#!/bin/bash

# List available networks
NETWORK=$(nmcli --fields SSID,SECURITY,BARS device wifi list --rescan no | \
  sort -k3 -r | \
  awk '!seen[$1]++' | \
  rofi -dmenu -p "Wi-Fi: ")

# Extract just the SSID
SSID=$(echo "$NETWORK" | awk '{print $1}')

# If connection fails, prompt for password
PASSWORD=$(rofi -dmenu -p "Password" -password)
nmcli device wifi connect "$SSID" password "$PASSWORD"

# Connect
nmcli device wifi connect "$SSID"
