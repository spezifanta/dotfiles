#!/usr/bin/env bash
# Toggle a floating 3-month calendar (Monday-first, ISO week numbers).
# Bound to a left click on the polybar date module.
# Closes on: another click on the clock, Enter, or losing focus.
set -u

pidfile="${XDG_RUNTIME_DIR:-/tmp}/polybar-cal.pid"

# Already open? close it. The exec below keeps this script's PID, so the
# pidfile holds alacritty's own PID -- no fuzzy cmdline matching.
if [ -r "$pidfile" ]; then
    pid=$(cat "$pidfile")
    if [ -n "$pid" ] && [ "$(cat "/proc/$pid/comm" 2>/dev/null)" = "alacritty" ]; then
        kill "$pid" 2>/dev/null
        rm -f "$pidfile"
        exit 0
    fi
    rm -f "$pidfile"
fi

echo $$ > "$pidfile"

# Watcher: close the popup as soon as it loses focus (click anywhere else).
# Started before the exec so it survives as a sibling process.
active_is_popup() {
    wid=$(xdotool getactivewindow 2>/dev/null) || return 1
    [ -n "$wid" ] || return 1
    xprop -id "$wid" WM_CLASS 2>/dev/null | grep -q '"polybar-cal"'
}

(
    focused=no
    for _ in $(seq 30); do
        if active_is_popup; then
            focused=yes
            break
        fi
        sleep 0.1
    done
    # never got focus -> leave it alone, Enter/click still close it
    [ "$focused" = yes ] || exit 0

    while active_is_popup; do
        sleep 0.2
    done
    i3-msg '[class="polybar-cal"] kill' >/dev/null 2>&1
    rm -f "$pidfile"
) >/dev/null 2>&1 &

exec alacritty \
    --class polybar-cal \
    -o window.dimensions.columns=84 -o window.dimensions.lines=12 \
    -o window.padding.x=12 -o window.padding.y=10 \
    -e sh -c 'ncal -b -3 -M -w; read -r _'
