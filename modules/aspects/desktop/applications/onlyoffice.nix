{
  flake.modules.homeManager.onlyoffice = _: {
    programs.onlyoffice = {
      enable = true;

      settings = { };
    };
  };
}

