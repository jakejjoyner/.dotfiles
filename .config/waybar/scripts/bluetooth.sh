#!/usr/bin/env bash

BLUETOOTH_POWERED=$(bluetoothctl show | grep "Powered: yes")
CONNECTED_DEVICE=$(bluetoothctl devices Connected | awk '{$1=$2=""; print $0}' | xargs)

if [ -z "$BLUETOOTH_POWERED" ]; then
    CLASS="off"
    TEXT="off"
    TOOLTIP="Bluetooth is off"
elif [ -n "$CONNECTED_DEVICE" ]; then
    CLASS="connected"
    TEXT="${CONNECTED_DEVICE}"
    TOOLTIP="Connected to: ${CONNECTED_DEVICE}"
else
    CLASS="on"
    TEXT="on"
    TOOLTIP="Bluetooth on, no device connected"
fi

echo "{\"text\": \"${TEXT}\", \"tooltip\": \"${TOOLTIP}\", \"class\": \"${CLASS}\"}"
