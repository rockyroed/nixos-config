#!/run/current-system/sw/bin/bash

# Get the active window ID
win=$(xdotool getactivewindow 2>/dev/null)

# Ensure the window ID is valid (i3 can return "0" for no active window)
if [ -z "$win" ] || [ "$win" -eq 0 ]; then
    exit 0
fi

# Get window geometry
geometry=$(xdotool getwindowgeometry --shell "$win" 2>/dev/null) || exit 0

# Ensure geometry is not empty
[ -z "$geometry" ] && exit 0

# Evaluate geometry variables
eval "$geometry"

# Ensure WIDTH and HEIGHT are valid numbers before proceeding
if [ -z "$WIDTH" ] || [ -z "$HEIGHT" ] || [ "$WIDTH" -le 0 ] || [ "$HEIGHT" -le 0 ]; then
    exit 0
fi

# Move the mouse to the center of the window
xdotool mousemove $((X + WIDTH / 2)) $((Y + HEIGHT / 2))
