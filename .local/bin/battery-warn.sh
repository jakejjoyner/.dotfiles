#!/bin/bash
# battery-warn — notify when battery is low on laptops with a battery.
# Uses host-profile for capability check; falls back to sysfs probe.
#
# Background: previously this script assumed /sys/class/power_supply/BAT0
# existed. On desktops it doesn't, so `$BATTERY` was empty, and bash's
# `[[ "" -le 5 ]]` evaluates TRUE → spurious "Battery Critical"
# notifications on every timer tick. Fixed 2026-04-20 with double-gate:
# host-profile declaration AND sysfs presence check. Exit 0 silently on
# no-battery hosts.

# Option-A self-aware pattern per Jake 2026-04-20 close: scripts that
# might not apply on all hosts should early-exit cleanly.
[ -f ~/.config/host-profile ] && . ~/.config/host-profile
if [ "${HAS_BATTERY:-unknown}" = "0" ]; then
    exit 0
fi

BATTERY_PATH=""
for candidate in /sys/class/power_supply/BAT0 \
                 /sys/class/power_supply/BAT1 \
                 /sys/class/power_supply/macsmc-battery; do
    if [ -d "$candidate" ] && [ -r "$candidate/capacity" ]; then
        BATTERY_PATH="$candidate"
        break
    fi
done

# Sysfs fallback: if host-profile didn't declare HAS_BATTERY=1 AND we
# can't find a battery path, exit quietly. Defense-in-depth for new hosts
# that haven't authored a host-profile yet.
if [ -z "$BATTERY_PATH" ]; then
    exit 0
fi

BATTERY=$(cat "$BATTERY_PATH/capacity" 2>/dev/null)
STATUS=$(cat "$BATTERY_PATH/status" 2>/dev/null)

# Read failure → don't notify (avoid the empty-string arithmetic bug).
if [ -z "$BATTERY" ] || [ -z "$STATUS" ]; then
    exit 0
fi

if ! [[ "$BATTERY" =~ ^[0-9]+$ ]]; then
    exit 0
fi

if [[ "$STATUS" == "Charging" || "$STATUS" == "Full" ]]; then
    exit 0
fi

if [[ "$BATTERY" -le 5 ]]; then
    notify-send -u critical -i battery-caution "Battery Critical" "${BATTERY}% — Plug in now!"
elif [[ "$BATTERY" -le 10 ]]; then
    notify-send -u critical -i battery-caution "Battery Critical" "${BATTERY}% remaining"
elif [[ "$BATTERY" -le 20 ]]; then
    notify-send -u normal -i battery-low "Battery Low" "${BATTERY}% remaining"
fi
