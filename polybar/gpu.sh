#!/bin/sh
nvidia-smi --query-gpu=utilization.gpu,temperature.gpu --format=csv,noheader,nounits |
    awk -F', ' '{printf "%s%%  %s°C\n", $1, $2}'
