{ config, pkgs, ... }:

{
    programs.firefox = {
        enable = true;
        profiles.roed = {
            name = "roed";
            isDefault = true;
            userChrome = builtins.readFile ./config/userChrome.css;
            userContent = builtins.readFile ./config/userContent.css;
        };
    };
}