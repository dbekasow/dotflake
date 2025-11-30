{
  flake.modules.homeManager.git = { config, ... }: {
    programs.git = {
      enable = true;

      settings = {
        user.name = config.metadata.fullName;
        user.email = config.metadata.email;
      };
    };
  };
}
