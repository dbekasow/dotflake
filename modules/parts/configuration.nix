{ config, inputs, lib, ... }: {
  options.nixosHosts = lib.mkOption {
    type = with lib.types; lazyAttrsOf deferredModule;
    description = "Nixos host configurations.";
    default = { };
  };

  config.flake.nixosConfigurations =
    lib.mapAttrs
      (hostName: hostConfiguration:
        inputs.nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            hostConfiguration
            { networking.hostName = hostName; }
            { nixpkgs.hostPlatform = lib.mkDefault system; }
          ];
        }
      )
      config.nixosHosts;
}
