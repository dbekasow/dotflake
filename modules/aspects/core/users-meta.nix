{ lib, ... }:
let
  inherit (lib) mkOption types;

  metaOptions = with types; {
    fullName = mkOption { type = str; };
    email = mkOption { type = str; };
    sshKeys = mkOption { type = listOf str; default = [ ]; };
    yubiKeys = mkOption { type = listOf str; default = [ ]; };
  };
in
{
  flake.modules.nixos.users-meta = { lib, ... }: {
    options.metadata = lib.mkOption {
      type = with lib.types; attrsOf (submodule { options = metaOptions; });
      description = "Nixos users profiles.";
      default = { };
    };

    config.home-manager.sharedModules = [
      (
        { config, osConfig, ... }: {
          options.metadata = metaOptions;
          # access nixos metadata via osConfig
          config.metadata = osConfig.metadata.${config.home.username};
        }
      )
    ];
  };
}
