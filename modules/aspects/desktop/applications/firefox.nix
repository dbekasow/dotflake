{
  flake.modules.homeManager.firefox = _: {
    programs.firefox = {
      enable = true;
    };

    stylix.targets.firefox.profileNames = [ "default" ];
  };
}

