{
  flake.modules.nixos.network-wifi = { lib, ... }: {
    networking = {
      wireless.iwd = {
        enable = true;
        settings = {
          IPv6.Enabled = true;
          Settings.AutoConnect = true;
        };
      };
      networkmanager = {
        enable = lib.mkDefault true;
        wifi.backend = "iwd";
        wifi.powersave = true;
        plugins = lib.mkDefault [ ];
      };
    };
  };
}
