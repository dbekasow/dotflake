{ self, ... }:
let
  username = "dns";
in
{
  flake.modules.nixos."${username}" = {
    metadata."${username}" = {
      fullName = "Denis Bekasow";
      email = "denis.bekasow@proton.me";
    };

    users.users."${username}" = {
      isNormalUser = true;

      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };

    home-manager.users."${username}" = {
      imports = [ self.modules.homeManager."${username}" ];
    };
  };

  flake.modules.homeManager."${username}" = { osConfig, ... }: {
    imports = with self.modules.homeManager; [
      # Desktop
      dms
      dms-plugins
      niri
      ghostty

      # Tools
      git
      helix
    ];

    home.username = username;
    home.stateVersion = osConfig.system.stateVersion;
  };
}
