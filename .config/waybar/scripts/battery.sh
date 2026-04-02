#!/usr/bin/env bash
# Waybar custom battery module with smaller, raised emoji

BATTERY_PATH="/sys/class/power_supply/BAT0"

if [ ! -d "$BATTERY_PATH" ]; then
    BATTERY_PATH="/sys/class/power_supply/BAT1"
fi

if [ ! -d "$BATTERY_PATH" ]; then
    echo '{"text": "<span size=\"small\" rise=\"2048\">⚡</span> AC", "tooltip": "No battery found", "class": "ac"}'
    exit 0
fi

CAPACITY=$(cat "$BATTERY_PATH/capacity" 2>/dev/null || echo "0")
STATUS=$(cat "$BATTERY_PATH/status" 2>/dev/null || echo "Unknown")

if [ "$STATUS" = "Charging" ]; then
    EMOJI="⚡"
elif [ "$CAPACITY" -ge 40 ]; then
    EMOJI="🔋"
else
    EMOJI="🪫"
fi

if [ "$STATUS" = "Charging" ]; then
    CLASS="charging"
elif [ "$CAPACITY" -le 15 ]; then
    CLASS="critical"
elif [ "$CAPACITY" -le 30 ]; then
    CLASS="low"
elif [ "$CAPACITY" -ge 90 ]; then
    CLASS="full"
else
    CLASS="normal"
fi

TOOLTIP="Battery: ${CAPACITY}%\nStatus: ${STATUS}"

if [ -f "$BATTERY_PATH/energy_now" ] && [ -f "$BATTERY_PATH/energy_full" ]; then
    ENERGY_NOW=$(cat "$BATTERY_PATH/energy_now")
    ENERGY_FULL=$(cat "$BATTERY_PATH/energy_full")
    TOOLTIP="${TOOLTIP}\nEnergy: $((ENERGY_NOW / 1000)) / $((ENERGY_FULL / 1000)) mWh"
fi

echo "{\"text\": \"<span size='small' rise='900'>${EMOJI}</span> ${CAPACITY}%\", \"tooltip\": \"${TOOLTIP}\", \"class\": \"${CLASS}\"}"
