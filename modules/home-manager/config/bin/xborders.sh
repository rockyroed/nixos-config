OUTPUT_FILE="$HOME/xborder_output.log"  # Specify the path to the output file

sleep 2

while ! pgrep -x "picom" > /dev/null; do
    echo "$(date): Waiting for Picom to start..." >> "$OUTPUT_FILE"
    sleep 2  # Wait for 2 seconds before checking again
done

echo "$(date): Picom detected. Running xborders..." >> "$OUTPUT_FILE"

# Go to xborders dir in dotfiles
cd ~/.dotfiles/modules/shell/python/github/lunegh/xborders/

# Run nix-shell and execute xborders
nix-shell --command "zsh -c './xborders'"
