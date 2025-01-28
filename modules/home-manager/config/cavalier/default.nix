{ config, pkgs, ... }:

{
    programs.cavalier = {
        enable = true;
        settings = {
            cava = {
                color = {
                    gradient = true;
                    gradient_color_1 = "#a9b665";
                    gradient_color_2 = "#89b482";
                    gradient_color_3 = "#d8a657";
                    gradient_color_4 = "#e78a4e";
                    gradient_color_5 = "#ea6962";
                };
                general.framerate = 60;
                input.method = "alsa";
                smoothing.noise_reduction = 88;
            };
            general = {
                ShowControls = true;
                ColorProfiles = [
                    {
                        Name = "Default";
                        FgColors = [
                            "#ffed333b"
                            "#ffffa348"
                            "#fff8e45c"
                            "#ff57e389"
                            "#ff62a0ea"
                            "#ffc061cb"
                        ];
                        BgColors = [
                            "#ff1e1e2e"
                        ];
                        Theme = 1;
                    }
                ];
                ActiveProfile = 0;
            };
        };
    };
}