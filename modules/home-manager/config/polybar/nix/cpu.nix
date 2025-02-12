{...}: let
  yellow = "#d8a657";
in {
  services.polybar.config = {
    "module/cpu" = {
      type = "internal/cpu";
      interval = "2";
      format-underline = "${yellow}";
      label = "%{T2}  %{T-}%percentage:1%% ";
    };
  };
}
