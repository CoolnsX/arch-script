#!/usr/bin/env sh

killall -q nm-applet
while pgrep -x nm-applet >/dev/null; do sleep 1; done
nm-applet &

killall -q blueman-applet
while pgrep -x blueman-applet >/dev/null; do sleep 1; done
blueman-applet &
