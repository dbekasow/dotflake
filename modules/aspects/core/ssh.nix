{
  flake.modules.nixos.ssh = { lib, pkgs, ... }: {
    services.openssh = {
      enable = true;

      settings = {
        PermitRootLogin = lib.mkDefault "prohibit-password";
        PasswordAuthentication = lib.mkDefault false;
      };
    };

    networking.firewall.allowedTCPPorts = [ 22 ];

    environment.systemPackages = [ pkgs.openssh ];
  };
}
