{ self, ... }:
let
  username = "dns-dmi";
in
{
  flake.modules.nixos."${username}" = { pkgs, ... }: {
    metadata."${username}" = {
      fullName = "Denis Bekasow";
      email = "denis.bekasow@dmi.de";
    };

    users.users."${username}" = {
      isNormalUser = true;
      shell = pkgs.fish;

      extraGroups = [ "wheel" "docker" "networkmanager" ];
    };

    home-manager.users."${username}" = {
      imports = [ self.modules.homeManager."${username}" ];
    };
  };

  flake.modules.homeManager."${username}" = { osConfig, ... }: {
    imports = with self.modules.homeManager; [
      bundle-terminal-base
      bundle-terminal-extended
      bundle-development
      bundle-cloud
    ];

    home.username = username;
    home.stateVersion = osConfig.system.stateVersion;
  };
}
