{ config, pkgs, ... }:

{
    services.flameshot = {
        enable = true;
        settings = {
            General = {
                disabledTrayIcon = true;
                showStartupLaunchMessage = false;
                saveAsFileExtension = ".png";
                savePath = "/tmp";
                uiColor = "#a9b665";
                contrastUiColor = "#3b4439";
                drawColor = "#ea6962";
            };
        };
    };
}