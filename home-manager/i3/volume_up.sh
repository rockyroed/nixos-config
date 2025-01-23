current_volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | sed 's/%//')
new_volume=$((current_volume + 5))

if [ $new_volume -gt 100 ]; then
    new_volume=100
fi

pactl set-sink-volume @DEFAULT_SINK@ ${new_volume}%
