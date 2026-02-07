{
  flake.modules.homeManager.helm = { pkgs, ... }: {
    home.packages = [ pkgs.kubernetes-helm ];
  };
}

