# Terminate already running bar instances
killall -q .polybar-wrapped
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
while pgrep -u $UID -x .polybar-wrapper >/dev/null; do sleep 1; done

sleep 1

# Launch Polybar instances
if type "xrandr"; then
  MONITOR=HDMI-1 TRAY_POS=HDMI-1 polybar --reload toph &
  sleep 0.25
  MONITOR=DP-1 polybar --reload toph &
else
  echo "Fallback: launching Polybar on default monitor"
  MONITOR=default TRAY_POS=$TRAY_POS polybar --reload toph &
fi

echo "Bars launched..."

