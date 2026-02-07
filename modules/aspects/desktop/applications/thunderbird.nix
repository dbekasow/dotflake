{
  flake.modules.homeManager.thunderbird = _: {
    programs.thunderbird = {
      enable = true;

      profiles = { };
      settings = { };
    };
  };
}

