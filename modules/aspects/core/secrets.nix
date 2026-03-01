{ inputs, ... }: {
  flake.modules.nixos.secrets = { config, ... }: {
    imports = [
      inputs.agenix.nixosModules.default
      inputs.agenix-rekey.nixosModules.default
    ];

    age.rekey = rec {
      localStorageDir = inputs.self + "/modules/deployments/hosts/${config.networking.hostName}/secrets";
      hostPubkey = localStorageDir + "/host.pub";
      masterIdentities = [{
        identity = inputs.self + "/master-key.age";
        pubkey = "age1kalxvlmjjydtdps5n27qyf5cf6eqwzuaesemj4enp8ulyw3mcsls3rkpd6";
      }];
      storageMode = "local";
    };
  };

  flake.modules.homeManager.secrets = {
    imports = [
      inputs.agenix.homeManagerModules.default
    ];
  };
}
