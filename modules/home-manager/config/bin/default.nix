{ config, pkgs, ... }:

{
    home.file = {
        ".bin/headphone_audio.sh".source = ./headphone_audio.sh;
        ".bin/xborders.sh".source = ./xborders.sh;
        ".bin/spotify_cava.sh".source = ./spotify_cava.sh;
    };
}