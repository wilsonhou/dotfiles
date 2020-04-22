#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Check if external monitor is attached
my_laptop_external_monitor=$(xrandr --query | grep 'HDMI1')

# Launch bar1 and (bar2 if external is attached)
polybar mybar -c ~/.config/polybar/config.ini &

if [[ $my_laptop_external_monitor = *disconnected* ]]; then
	echo "1 Polybar launched..."
else
	polybar mybar2 -c ~/.config/polybar/config.ini &
	echo "2 Polybars launched..."
fi
