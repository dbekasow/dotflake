{
  flake.modules.homeManager.eza = _: {
    programs.eza = {
      enable = true;

      colors = "always";
      icons = "auto";

      git = true;

      extraOptions = [ ];
    };
  };
}

