{ config, pkgs, ... }:

{
    home.file = {
        ".bin/headphone_audio.sh".source = ./headphone_audio.sh;
        ".bin/xborders.sh".source = ./xborders.sh;
        ".bin/spotify_cava.sh".source = ./spotify_cava.sh;
        ".bin/center_mouse.sh".source = ./center_mouse.sh;
        ".bin/toggle_screen_timeout.sh".source = ./toggle_screen_timeout.sh;
    };
}