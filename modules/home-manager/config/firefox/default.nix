{ config, pkgs, ... }:

let
  readIfExists = path: if builtins.pathExists path then builtins.readFile path else "";
in
{
  programs.firefox = {
    enable = true;
    profiles.roed = {
      name = "roed";
      isDefault = true;
      userChrome = readIfExists ./config/chrome/userChrome.css;
      userContent = readIfExists ./config/chrome/userContent.css;
      extraConfig = readIfExists ./config/chrome/user.js;
    };
  };
}
