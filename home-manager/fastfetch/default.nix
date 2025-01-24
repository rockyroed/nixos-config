{ config, pkgs, ... }:

{
    programs.fastfetch = {
        enable = true;
        settings = {
            logo = {
                source = "nixos_small";
                padding = {
                right = 2;
                };
            };
            display = {
                size = {
                    binaryPrefix = "si";
                };
                color = "green";
                separator = "   ";
            };
            modules = [
                {
                    type = "custom";
                    outputColor = "blue";
                    format = ''┌──────────────────── OS Information ────────────────────┐'';
                }
                {
                    type = "title";
                    key = " ╭─  ";
                }
                {
                    type = "os";
                    key = " ├─ 󱄅 ";
                }
                {
                    type = "kernel";
                    key = " ├─  ";
                }
                {
                    type = "packages";
                    key = " ├─  ";
                }
                {
                    type = "shell";
                    key = " ╰─  ";
                }
                {
                    type = "custom";
                    outputColor = "blue";
                    format = ''├───────────────── Hardware Information ─────────────────┤'';
                }
                {
                    type = "display";
                    key = " ╭─ 󰍹 ";
                    compactType = "original-with-refresh-rate";
                }
                {
                    type = "cpu";
                    key = " ├─ 󰍛 ";
                }
                {
                    type = "gpu";
                    key = " ├─  ";
                }
                {
                    type = "memory";
                    key = " ╰─  ";
                }
                {
                    type = "custom";
                    outputColor = "blue";
                    format = ''├───────────────── Software Information ─────────────────┤'';
                }
                {
                    type = "wm";
                    key = " ╭─  ";
                }
                {
                    type = "terminal";
                    key = " ├─  ";
                }
                {
                    type = "icons";
                    key = " ╰─ 󰈹 ";
                }
                {
                    type = "custom";
                    outputColor = "blue";
                    format = ''└────────────────────────────────────────────────────────┘'';
                }
                {
                    type = "custom";
                    format = "   {#39}    {#34}    {#36}    {#35}    {#34}    {#33}    {#32}    {#31}    {#39}    {#34}    {#36} ";
                }
                "break"
            ];
        };
    };
}