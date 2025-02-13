{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    (pkgs.writeShellScriptBin "filen" ''
      exec "$HOME/.AppImage/Filen.AppImage" "$@"
    '')
  ];

  xdg.desktopEntries = {
    filen = {
      name = "Filen";
      genericName = "A file cloud manager";
      exec = "/home/${config.home.username}/.AppImage/Filen.AppImage";
      type = "Application";
      categories = [
        "Application"
        "Utility"
        "FileManager"
      ];
      mimeType = [
        "inode/directory"
      ];
    };
  };
}
