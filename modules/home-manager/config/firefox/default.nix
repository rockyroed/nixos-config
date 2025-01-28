{ config, pkgs, ... }:

{
    programs.firefox = {
        enable = true;
        profiles.roed = {
            name = "roed";
            isDefault = true;
            search = {
                default = "DuckDuckGo";
                privateDefault = "DuckDuckGo";
                order = [
                    "DuckDuckGo"
                    "Google"
                ];
                engines = {
                    "Nix Packages" = {
                        urls = [
                            {
                                template = "https://search.nixos.org/packages";
                                params = [
                                    {
                                        name = "type";
                                        value = "packages";
                                    }
                                    {
                                        name = "query";
                                        value = "{searchTerms}";
                                    }
                                ];
                            }
                        ];
                        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                        definedAliases = [ "@np" ];
                    };
                    "NixOS Wiki" = {
                        urls = [ { template = "https://wiki.nixos.org/index.php?search={searchTerms}"; } ];
                        iconUpdateURL = "https://wiki.nixos.org/favicon.png";
                        definedAliases = [ "@nw" ];
                    };
                };
            };
            userChrome = builtins.readFile ./config/userChrome.css;
            userContent = builtins.readFile ./config/userContent.css;
            containers = {
                work = {
                    name = "Work";
                    color = "blue";
                    icon = "briefcase";
                    id = 1;
                };
                school = {
                    name = "School";
                    color = "green";
                    icon = "fruit";
                    id = 2;
                };
            };
        };
    };
}