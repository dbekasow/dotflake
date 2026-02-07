{
  flake.modules.homeManager.zellij = _: {
    programs.zellij = {
      enable = true;

      layouts = { };

      settings = { };
    };
  };
}

