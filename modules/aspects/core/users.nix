{
  flake.modules.nixos.users = { config, lib, ... }: {
    users.allowNoPasswordLogin = lib.mkDefault true;
    users.mutableUsers = false;

    users.users = lib.genAttrs
      (lib.attrNames config.metadata)
      (name: { openssh.authorizedKeys.keys = config.metadata.${name}.sshKeys; });

    programs.fish = {
      enable = true;
      useBabelfish = true;
    };
  };
}
