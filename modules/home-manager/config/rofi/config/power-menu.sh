#!/run/current-system/sw/bin/bash
# Power menu options
options="Shutdown\nReboot\nLog Out\nLock\nSuspend\nHibernate\nCancel"

# Show options in Rofi
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu" -theme-str '@import "gruvbox-material"')

case "$chosen" in
"Shutdown")
    systemctl poweroff
    ;;
"Reboot")
    systemctl reboot
    ;;
"Log Out")
    # Depending on your session manager (like i3, sway, etc.), modify this command.
    pkill -KILL -u "$USER"
    ;;
"Lock")
    # Locks the screen using your preferred method (e.g., i3lock or betterlockscreen)
    betterlockscreen -l dim
    ;;
"Suspend")
    systemctl suspend
    ;;
"Hibernate")
    systemctl hibernate
    ;;
"Cancel")
    exit 0
    ;;
*)
    exit 1
    ;;
esac
