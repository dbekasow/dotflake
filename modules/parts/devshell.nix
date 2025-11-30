{
  perSystem =
    { config, pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        name = "dotnix";
        inputsFrom = [
          config.treefmt.build.devShell
          config.pre-commit.devShell
        ];
        packages = with pkgs; [
          # Development
          nil
          nixd

          # Management
          nh
          nvd
          nurl
          nix-tree
          nix-index
          nix-inspect
          nix-search-tv
          nix-search-cli
          nix-output-monitor
          # Misc
          git
          just
          direnv
        ];
        shellHook = config.pre-commit.installationScript;
      };
    };
}
