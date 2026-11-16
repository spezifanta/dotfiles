#!/bin/sh
# NVIDIA GPU load/temp for polybar. Prints nothing on machines without an
# NVIDIA card (polybar hides a module whose script outputs nothing), so this
# stays portable across hosts.
command -v nvidia-smi >/dev/null 2>&1 || exit 0

nvidia-smi --query-gpu=utilization.gpu,temperature.gpu --format=csv,noheader,nounits 2>/dev/null |
    awk -F', ' '{printf "%s%%  %s°C\n", $1, $2}'
