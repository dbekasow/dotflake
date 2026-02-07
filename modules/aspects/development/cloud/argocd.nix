{
  flake.modules.homeManager.argocd = { pkgs, ... }: {
    home.packages = [ pkgs.argocd ];
  };
}

