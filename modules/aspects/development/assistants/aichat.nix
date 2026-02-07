{
  flake.modules.homeManager.aichat = _: {
    programs.aichat = {
      enable = true;

      agents = { };
      settings = { };
    };
  };
}
