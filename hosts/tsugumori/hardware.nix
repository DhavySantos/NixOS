{ config, lib, pkgs, modulesPath, ... }: {
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/boot" = lib.mkForce {
		device = "/dev/disk/by-id/nvme-NVME_SSD_512GB_GSMD22A0900736-part1";
		options = [ "fmask=0022" "dmask=0022" ];
		fsType = "vfat";
	};

	fileSystems."/" = lib.mkForce {
		device = "/dev/disk/by-id/nvme-NVME_SSD_512GB_GSMD22A0900736-part2";
		fsType = "ext4";
	};

  fileSystems."/mnt/hitachi" = lib.mkForce {
    device = "/dev/disk/by-id/ata-Hitachi_HTS547550A9E384_J2260056GD9SXC-part1";
    options = [ "defaults" ];
    fsType = "xfs";
  };

  fileSystems."/mnt/toshiba" = lib.mkForce {
    device = "/dev/disk/by-id/ata-TOSHIBA_HDWD120_Y831YZJAS-part1";
    options = [ "defaults" ];
    fsType = "xfs";
  };

  swapDevices = [{
    device = "/swapfile";
    size = 16 * 1024;
  }];

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.useDHCP = lib.mkDefault true;
}
