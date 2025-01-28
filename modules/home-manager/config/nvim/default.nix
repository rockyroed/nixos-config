{ config, pkgs, ... }:

{
    programs.nvf = {
        enable = true;
        settings = {
            vim = {
                viAlias = true;
                vimAlias = true;
                lsp = {
                    enable = true;
                };
                theme = {
                    enable = true;
                    name = "gruvbox";
                    style = "dark";
                };
                languages = {
                    enableLSP = true;
                    enableTreesitter = true;
                    nix.enable = true;
                    python.enable = true;
                    ts.enable = true;
                    markdown.enable = true;
                    html.enable = true;
                    php.enable = true;
                };
                statusline.lualine.enable = true;
                telescope.enable = true;
                autocomplete.nvim-cmp.enable = true;
            };
        };
    };
}