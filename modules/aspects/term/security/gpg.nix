{
  flake.modules.homeManager.gpg = _: {
    programs.gpg = {
      enable = true;

      settings = { };
    };
  };
}

