{ self, ... }: {
  nixosHosts.zoro = { ... }: {
    imports = with self.modules.nixos; [
      # Core
      fonts
      home-manager
      locale
      nix
      nix-substituters
      security
      system-packages
      users
      users-meta

      # Development
      docker

      # User
      dns-dmi
    ];

    system.stateVersion = "25.11";
  };
}
