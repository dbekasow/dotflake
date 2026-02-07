{
  flake.modules.homeManager.helix = _: {
    programs.helix = {
      enable = true;

      settings = { };
    };
  };
}
