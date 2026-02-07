{
  flake.modules.homeManager.atuin = _: {
    programs.atuin = {
      enable = true;

      settings = { };
    };
  };
}
