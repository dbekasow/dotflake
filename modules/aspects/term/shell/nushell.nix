{
  flake.modules.homeManager.nushell = _: {
    programs.nushell = {
      enable = true;

      plugins = [ ];
      settings = { };
    };
  };
}

