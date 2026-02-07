{
  flake.modules.homeManager.jujutsu = _: {
    programs.jujutsu = {
      enable = true;

      settings = { };
    };
  };
}

