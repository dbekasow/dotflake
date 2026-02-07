{
  flake.modules.homeManager.fastfetch = _: {
    programs.fastfetch = {
      enable = true;

      settings = { };
    };
  };
}

