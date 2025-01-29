{ config, pkgs, ... }:

{
    programs.firefox = {
        enable = true;
        profiles.roed = {
            name = "roed";
            isDefault = true;
            userChrome = builtins.readFile ./config/chrome/userChrome.css;
            userContent = builtins.readFile ./config/chrome/userContent.css;
        };
    };
}