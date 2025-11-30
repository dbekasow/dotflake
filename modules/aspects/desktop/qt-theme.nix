{
  flake.modules.nixos.qt-theme = {
    qt = {
      enable = true;
      platformTheme = "gnome";
      style = "adwaita-dark";
    };
  };
}
