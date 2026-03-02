{
  flake.modules.nixos.security = { config, lib, ... }: {
    security.rtkit.enable = true;
    security.polkit.enable = true;

    security.sudo-rs = {
      enable = true;
      execWheelOnly = true;
      wheelNeedsPassword = false;
    };

    security.pki.certificateFiles =
      let certDir = "${config.deployments.hostDir}/certificates";
      in lib.optionals
        (builtins.pathExists certDir)
        (lib.filesystem.listFilesRecursive certDir);
  };
}
