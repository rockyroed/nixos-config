OUTPUT_FILE="./xborder_output.log"  # Specify the path to the output file

sleep 2

while ! pgrep -x "picom" > /dev/null; do
    echo "$(date): Waiting for Picom to start..." >> "$OUTPUT_FILE"
    sleep 2  # Wait for 2 seconds before checking again
done

echo "$(date): Picom detected. Running xborders..." >> "$OUTPUT_FILE"
xborders --border-radius 6 --border-width 3 --border-rgba "#91D7E3FF"
