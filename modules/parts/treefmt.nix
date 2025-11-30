{ inputs, ... }:
{
  imports = [ inputs.treefmt.flakeModule ];

  perSystem =
    { config, ... }:
    {
      treefmt = {
        programs = {
          # Nix formatter
          nixpkgs-fmt.enable = true;

          # Nix linter
          deadnix.enable = true;
          statix.enable = true;

          # Shell
          just.enable = true;
          shfmt.enable = true;
          shellcheck.enable = true;

          # Text
          typos.enable = true;
          prettier.enable = true;
        };
      };
      formatter = config.treefmt.build.wrapper;
    };
}
