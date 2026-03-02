{ self, ... }: {
  nixosHosts.zoro = { ... }: {
    imports = with self.modules.nixos; [
      # Core
      fonts
      home-manager
      host-path
      locale
      nix
      nix-substituters
      security
      secrets
      ssh
      stylix
      system-packages
      users
      users-meta
      users-password

      # Development
      docker

      # User
      dns-dmi
    ];

    system.stateVersion = "25.11";
  };
}
