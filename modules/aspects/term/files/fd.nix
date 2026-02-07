{
  flake.modules.homeManager.fd = _: {
    programs.fd = {
      enable = true;

      ignores = [ ];
      extraOptions = [ ];
    };
  };
}

