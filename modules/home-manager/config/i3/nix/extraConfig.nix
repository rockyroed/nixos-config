{...}: let
  mod = "Mod4";
  ws7 = "7";
  ws8 = "8";
in {
  xsession.windowManager.i3.extraConfig = ''
    # Hide borders and titlebars
    for_window [class="^.*"] pixel 0

    # Window borders
    for_window [class="^.*"] border pixel 2

    # Move Firefox Messenger calls to workspace 7
    for_window [class="firefox" title="Messenger call — Mozilla Firefox"] move to workspace ${ws7}

    # Move cava to workspace 8
    for_window [class="kitty" title="cava"] move to workspace ${ws8}, floating enable, resize set 300 px 169 px, move position 182 ppt 15 ppt

    # Don't focus on a window_role of alert
    no_focus [window_role="alert"]

    # Launcher mode
    set $launcher [launch mode]
    bindsym ${mod}+d mode "$launcher"

    mode "$launcher" {
      bindsym e exec --no-startup-id thunar, mode "default"
      bindsym f exec --no-startup-id firefox, mode "default"
      bindsym t exec --no-startup-id thunderbird, mode "default"
      bindsym v exec --no-startup-id vesktop, mode "default"
      bindsym c exec --no-startup-id code, mode "default"
      bindsym s exec --no-startup-id spotify, mode "default"
      bindsym Shift+s exec --no-startup-id ~/.bin/spotify_cava.sh, mode "default"

      # Exit mode
      bindsym Escape mode "default"
      bindsym Return mode "default"
    }

    # Gruvbox colors
    ${builtins.readFile ../config/gruvbox.conf}
  '';
}
