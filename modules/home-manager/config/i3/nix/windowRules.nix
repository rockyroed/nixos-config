{...}: let
  ws1 = "1";
  ws3 = "3";
  ws6 = "6";
  ws7 = "7";
  ws8 = "8";
  ws9 = "9";
in {
  xsession.windowManager.i3.config = {
    assigns = {
      "${ws1}" = [{class = "firefox";}];
      "${ws3}" = [{class = "Code";}];
      "${ws6}" = [
        {class = "discord";}
        {class = "vesktop";}
      ];
      "${ws7}" = [{class = "Signal";}];
      "${ws8}" = [{class = "Spotify";}];
      "${ws9}" = [{class = "obs";}];
    };
    floating = {
      criteria = [
        {window_role = "pop-up";}
        {window_role = "bubble";}
        {window_role = "alert";}
        {window_role = "task_dialog";}
        {window_role = "Preferences";}
        {window_type = "dialog";}
        {window_type = "menu";}
        {class = "kcalc";}
        {class = "gnome-calculator";}
        {class = "pavucontrol";}
        {
          class = "firefox";
          title = "Library";
        }
        {
          class = "Filen";
        }
      ];
    };
  };
}
