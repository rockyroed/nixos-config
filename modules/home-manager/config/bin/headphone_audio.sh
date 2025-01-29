#!/run/current-system/sw/bin/bash
sleep 1

amixer -D 'hw:PCH' sset 'Headphone' unmute && amixer -D 'hw:PCH' sset 'Headphone' 64dB
