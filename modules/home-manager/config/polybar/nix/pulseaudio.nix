{...}: let
  background-5 = "#5a524c";
  aqua = "#89b482";
in {
  services.polybar.config = {
    "module/pulseaudio" = {
      type = "internal/pulseaudio";

      format-volume = "<label-volume>";
      format-volume-underline = "${aqua}";
      format-muted-underline = "${background-5}";

      label-volume = "%{T2}%{T-} %percentage:3%%";

      label-muted = "%{T2} %{T-} --%";
      label-muted-foreground = "${background-5}";

      click-right = "pavucontrol";
    };
  };
}
