{...}: let
  background-5 = "#5a524c";
  aqua = "#89b482";
in {
  services.polybar.config = {
    "module/pulseaudio" = {
      type = "internal/pulseaudio";

      format-volume = "<ramp-volume> <label-volume>";
      format-volume-underline = "${aqua}";
      format-muted-underline = "${background-5}";

      ramp-volume-0 = "%{T2} %{T-}";
      ramp-volume-1 = "%{T2} %{T-}";
      ramp-volume-2 = "%{T2} %{T-}";

      label-volume = "%percentage%%";

      label-muted = "%{T2}  %{T-}";
      label-muted-foreground = "${background-5}";

      click-right = "pavucontrol";
    };
  };
}
