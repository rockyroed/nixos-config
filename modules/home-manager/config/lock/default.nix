{ config, pkgs, ... }:

{
    services.screen-locker = {
        enable = true;
        lockCmd = "betterlockscreen -l";
        inactiveInterval = 30;
        xautolock = {
            enable = true;
            detectSleep = true;
        };
    };
}
