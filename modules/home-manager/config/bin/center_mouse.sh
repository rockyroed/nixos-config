#!/run/current-system/sw/bin/bash

# Get the focused window ID
win=$(xdotool getwindowfocus 2>/dev/null)

# Exit if there's no focused window
[ -z "$win" ] && exit 0

# Get window geometry
eval "$(xdotool getwindowgeometry --shell "$win" 2>/dev/null)" || exit 0

# Move the mouse to the center of the window
xdotool mousemove $((X + WIDTH / 2)) $((Y + HEIGHT / 2))
