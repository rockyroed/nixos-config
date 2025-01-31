#!/run/current-system/sw/bin/bash
# Get the current DPMS state
dpms_status=$(xset q | grep "DPMS is" | awk '{print $3}')

if [ "$dpms_status" = "Enabled" ]; then
  # If DPMS is enabled, turn it off
  xset s off -dpms
  dunstify -u normal "Screen Timeout" "Disabled DPMS and screensaver"
else
  # If DPMS is disabled, turn it on with your preferred settings
  xset s 900 dpms 1800 2700 3600
  dunstify -u normal "Screen Timeout" "Enabled DPMS and screensaver"
fi
