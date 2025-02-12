{...}: let
  blue = "#7daea3";
in {
  services.polybar.config = {
    "module/memory" = {
      type = "internal/memory";
      interval = "2";
      format-underline = "${blue}";
      label = "%{T2} %{T-}%percentage_used:2%%";
    };
  };
}
