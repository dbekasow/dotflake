{
  flake.modules.homeManager.git-delta = _: {
    programs.delta = {
      enable = true;
      enableGitIntegration = true;
      enableJujutsuIntegration = true;

      options = { };
    };
  };
}
