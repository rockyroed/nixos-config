{ config, pkgs, ... }:

{
    programs.bat = {
        enable = true;
        themes = {
            gruvbox = {
                src = pkgs.fetchFromGitHub {
                    owner = "peaceant";
                    repo = "gruvbox";
                    rev = "e3db74d0e5de7bc09cab76377723ccf6bcc64e8c";
                    sha256 = "gsk3qdx+OHMvaOVOlbTapqp8iakA350yWT9Jf08uGoU=";
                };
                file = "gruvbox.tmTheme";
            };
        };
        config = {
            theme = "gruvbox";
            style = "plain";
        };
    };
}