{ inputs, ... }: {
  nixosHosts.zoro = { ... }: {
    imports = [ inputs.nixos-wsl.nixosModules.default ];

    wsl = {
      enable = true;
      defaultUser = "dns-dmi";

      startMenuLaunchers = true;
      useWindowsDriver = true;

      wslConf = {
        interop.enabled = true;
        interop.appendWindowsPath = false;
        network.generateHosts = true;
        network.generateResolvConf = true;
      };

      usbip.enable = true;
      usbip.autoAttach = [ ];
    };

    networking.interfaces.eth0.useDHCP = true;
    networking.nameservers = [ ];
  };
}
