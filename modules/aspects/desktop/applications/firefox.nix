{
  flake.modules.homeManager.firefox = _: {
    programs.firefox = {
      enable = true;
    };
  };
}

