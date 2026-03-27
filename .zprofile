if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] && uwsm check may-start; then
    exec uwsm start hyprland.desktop \
    && systemctl --user enable --now hyprpaper.service
fi
