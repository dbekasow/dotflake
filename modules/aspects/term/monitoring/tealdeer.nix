{
  flake.modules.homeManager.tealdeer = _: {
    programs.tealdeer = {
      enable = true;
      enableAutoUpdates = true;

      settings = { };
    };
  };
}

