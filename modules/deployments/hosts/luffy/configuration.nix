{ self, ... }: {
  nixosHosts.luffy = {
    imports = with self.modules.nixos; [
      # core
      fonts
      home-manager
      locale
      nix
      nix-substituters
      security
      ssh
      system-packages
      users
      users-meta
      yubikey

      # System
      bluetooth
      boot
      boot-limine
      disko
      geolocation
      network
      network-wifi
      pipewire
      power

      # Desktop
      dms
      dms-greeter
      niri
      gnome-services
      qt-theme
      xdg-portals

      # Development
      docker

      # Users
      dns
    ];

    disko.devices.disk.main.device = "/dev/sda";

    system.stateVersion = "25.11";
  };
}
