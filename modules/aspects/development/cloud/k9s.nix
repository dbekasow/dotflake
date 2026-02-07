{
  flake.modules.homeManager.k9s = _: {
    programs.k9s = {
      enable = true;

      plugins = { };
      settings = { };
      skins = { };
      views = { };
    };
  };
}

