#!/bin/bash
# Power menu for $mod+Shift+e
choice=$(printf '%s\n' "  Lock" "  Logout" "  Reboot" "  Shutdown" |
    rofi -dmenu -i -p " Power" \
        -theme-str 'window { width: 320px; } listview { lines: 4; } mode-switcher { enabled: false; }')

case "$choice" in
    *Lock) ~/bin/lock-screen ;;
    *Logout) i3-msg exit ;;
    *Reboot) systemctl reboot ;;
    *Shutdown) systemctl poweroff ;;
esac
