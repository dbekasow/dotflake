{
  flake.modules.nixos.users-password = { lib, config, ... }: {
    users.allowNoPasswordLogin = false;

    users.users = lib.genAttrs
      (lib.attrNames config.metadata)
      (name: { hashedPasswordFile = config.age.secrets."hashed-password-${name}".path; });

    age.secrets = lib.concatMapAttrs
      (name: _value: {
        "password-${name}" = {
          generator.script = "alnum";
          intermediary = true;
        };
        "hashed-password-${name}" = {
          generator = {
            dependencies = [ config.age.secrets."password-${name}" ];
            script = { pkgs, decrypt, deps, ... }: ''
              ${decrypt} ${lib.escapeShellArg (lib.head deps).file} | \
              ${pkgs.openssl}/bin/openssl passwd -6 stdin
            '';
          };
        };
      })
      config.metadata;
  };
}
