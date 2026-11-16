#!/bin/bash
# Started by i3 (exec_always), so it also restarts the bar on i3 reload.
killall -q polybar
while pgrep -u "$UID" -x polybar >/dev/null; do sleep 0.2; done

for m in $(polybar --list-monitors | cut -d: -f1); do
    MONITOR="$m" polybar main >>"/tmp/polybar-$m.log" 2>&1 &
    disown
done
