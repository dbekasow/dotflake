{
  flake.modules.homeManager.zed = _: {
    programs.zed-editor = {
      enable = true;

      extensions = [ ];
      extraPackages = [ ];
    };
  };
}

