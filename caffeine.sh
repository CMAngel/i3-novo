#!/usr/bin/env bash
# this script toggles automatic screen blanking and suspend
# useful when watching videos, for example
# depends on: X, xautolock, notification daemon

# get dpms status
DPMS=$(xset q | grep "DPMS is Disabled")

if [ "$DPMS" == "" ]; then
    # dpms enabed, turn it off
    xset s 0 0
    xset s noblank
    xset -dpms
    xautolock -disable
    echo " ON"
    # send notification
    notify-send -u low -a "Caffeine" -i "caffeine" "Caffeine ativado"
else
    # dpms disabled, turn it on
    xset s 0 300
    xset s blank
    xset +dpms
    xautolock -enable
    echo " OFF"
    notify-send -u low -a "Caffeine" -i "caffeine" "Caffeine desativado"
fi;
