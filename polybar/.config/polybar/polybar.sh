#!/bin/sh

pkill -x polybar
while pgrep -x polybar >/dev/null; do sleep 0.01; done
polybar top -c ~/.config/polybar/config &
