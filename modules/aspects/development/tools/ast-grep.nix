{
  flake.modules.homeManager.ast-grep = { pkgs, ... }: {
    home.packages = [ pkgs.ast-grep ];
  };
}

