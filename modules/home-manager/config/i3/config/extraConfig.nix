{ config, pkgs, ... }:

let
    ws7 = "7";
    ws8 = "8";
in {
    xsession.windowManager.i3.extraConfig = ''
        # Move Firefox Messenger calls to workspace 7
        for_window [class="firefox" title="Messenger call — Mozilla Firefox"] move to workspace ${ws7}

        # Move cava to workspace 8
        for_window [class="kitty" title="cava"] move to workspace ${ws8}, resize set width 400px

        # Hide borders and titlebars
        for_window [class="^.*"] pixel 0

        ${builtins.readFile ./gruvbox.conf}
    '';
}