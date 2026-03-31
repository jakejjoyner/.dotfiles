#!/bin/bash
if pgrep -x easyeffects > /dev/null 2>&1; then
    pkill easyeffects
else
    easyeffects
fi
