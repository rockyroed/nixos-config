{ config, pkgs, ... }:

let
    mod = "Mod4";
in {
    imports = [
        ./startup.nix
        ./cursor.nix
        ./keybindings.nix
        ./workspaces.nix
        ./window_rules.nix
        ./extraConfig.nix
    ];

    xsession.windowManager.i3 = {
        config = {
            modifier = "${mod}";
            fonts = {
                names = [ "JetBrains Mono Nerd Font" ];
                size = 10.0;
            };
            window = {
                border = 3;
                titlebar = false;
            };
            gaps = {
                inner = 12;
            };
            floating.modifier = "${mod}";
            bars = [
                {
                    fonts = {
                        names = [ "JetBrains Mono Nerd Font" ];
                        size = 10.0;
                    };
                    mode = "invisible";
                    command = "null";
                }
            ];
        };
    };
}