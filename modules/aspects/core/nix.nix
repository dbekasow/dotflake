{
  flake.modules.nixos.nix = { lib, ... }: {
    nixpkgs.config.allowUnfree = true;

    nix = {
      settings = {
        experimental-features = [ "nix-command" "flakes" ];
        auto-optimise-store = true;
        builders-use-substitutes = true;

        keep-outputs = true;
        keep-derivations = true;

        trusted-users = [ "root" "@wheel" ];
      };

      optimise.automatic = true;
      channel.enable = false;
    };

    programs.nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep 3 --keep-since 7d";
        dates = "weekly";
      };
    };

    environment.variables = {
      NH_FLAKE = lib.mkDefault "home/dns/.dotnix";
    };
  };
}
