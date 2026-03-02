{ inputs, ... }: {
  flake.modules.nixos.host-path = { config, lib, ... }: {
    options.deployment.hostDir = lib.mkOption {
      type = lib.types.path;
      default = inputs.self + "/modules/deployments/hosts/${config.networking.hostName}";
      readOnly = true;
    };
  };

  flake.modules.homeManager.user-path = { config, lib, ... }: {
    options.deployment.userDir = lib.mkOption {
      type = lib.types.path;
      default = inputs.self + "/modules/deployments/users/${config.home.username}";
      readOnly = true;
    };
  };
}
