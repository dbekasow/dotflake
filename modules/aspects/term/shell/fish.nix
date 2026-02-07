{
  flake.modules.homeManager.fish = _: {
    home.shell.enableFishIntegration = true;

    programs.fish = {
      enable = true;
    };
  };
}

