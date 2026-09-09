#!/bin/sh

killall -q polybar
while pgrep -x polybar > /dev/null; do sleep 0.5; done

if type "xrandr" 2>/dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main &
  done
else
  polybar --reload main &
fi
