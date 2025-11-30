{ inputs, ... }: {
  nixosHosts.luffy = {
    imports = [ inputs.nixos-hardware.nixosModules.dell-xps-13-9350 ];

    boot = {
      initrd.availableKernelModules = [
        "xhci_pci"
        "ahci"
        "nvme"
        "usb_storage"
        "sd_mod"
        "rtsx_pci_sdmmc"
      ];
      kernelModules = [ "kvm-intel" ];
    };

    hardware = {
      enableRedistributableFirmware = true;
      cpu.intel.updateMicrocode = true;
    };
  };
}
