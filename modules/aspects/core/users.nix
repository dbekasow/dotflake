{
  flake.modules.nixos.users = { pkgs, config, lib, ... }: {
    users = {
      allowNoPasswordLogin = true;
      mutableUsers = false;
      defaultUserShell = pkgs.fish;
    };

    users.users = lib.genAttrs
      (lib.attrNames config.metadata)
      (name: { openssh.authorizedKeys.keys = config.metadata.${name}.sshKeys; });

    programs.fish = {
      enable = true;
      useBabelfish = true;
    };
  };
}
