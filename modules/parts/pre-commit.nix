{ inputs, ... }:
{
  imports = [ inputs.git-hooks.flakeModule ];

  perSystem =
    { config, ... }:
    {
      pre-commit.settings = {
        excludes = [ "flake.lock" ];
        hooks = {
          # Format
          treefmt.enable = true;
          treefmt.package = config.treefmt.build.wrapper;

          # Secrets detection
          detect-private-keys.enable = true;

          # Spell checking
          typos.enable = true;

          # Conventional commits
          commitizen.enable = true;
        };
      };
    };
}
