{...}: let
  background-5 = "#5a524c";
  blue = "#7daea3";
in {
  services.polybar.config = {
    "network-base" = {
      type = "internal/network";
      interval = "5";
      format-connected = "<label-connected>";
      format-disconnected = "<label-disconnected>";
      label-disconnected = "%{F${background-5}} %ifname%%{F${background-5}} disconnected ";
    };

    "module/eth" = {
      "inherit" = "network-base";
      interface-type = "wired";
      label-connected = "%{T2} 󰈁 %{T-}";
      label-disconnected = "%{T2} 󰈂 %{T-}";
      label-disconnected-foreground = "${background-5}";
      format-connected-underline = "${blue}";
      format-disconnected-underline = "${background-5}";
    };
  };
}
