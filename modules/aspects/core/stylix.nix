{ inputs, ... }:
let
  defaultScheme = "share/themes/catppuccin-mocha.yaml";
  defaultStylix = { lib, pkgs, ... }: {
    stylix = {
      enable = true;
      base16Scheme = lib.mkDefault "${pkgs.base16-schemes}/${defaultScheme}";
      polarity = lib.mkDefault "dark";
    };
  };
in
{
  flake.modules.nixos.stylix = {
    imports = [
      inputs.stylix.nixosModules.stylix
      defaultStylix
    ];

    stylix.enableReleaseChecks = false;
    stylix.homeManagerIntegration.autoImport = false;
  };

  flake.modules.homeManager.stylix = {
    imports = [
      inputs.stylix.homeModules.stylix
      defaultStylix
    ];
  };
}
