{
  flake.modules.homeManager.bacon = _: {
    programs.bacon = {
      enable = true;

      settings = { };
    };
  };
}

