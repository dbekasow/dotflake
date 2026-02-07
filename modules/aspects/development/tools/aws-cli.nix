{
  flake.modules.homeManager.aws-cli = _: {
    programs.awscli = {
      enable = true;

      credentials = { };
      settings = { };
    };
  };
}

