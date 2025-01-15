{ config, lib, modulesPath, ... }: {
	imports = [
		(modulesPath + "/installer/scan/not-detected.nix")
	];

	boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
	boot.kernelParams = [
		"vfio-pci.ids=\"1002:aaf0,1002:6fdf,8086:a36d\""
		"amdgpu.ppfeaturemask=0xFFF7FFFF"
		"intel_iommu=on"
		"iommu=pt"
	];

  boot.extraModprobeConfig = ''
    options v4l2loopback video_nr=2,3 width=640,1920 max_width=1920 height=480,1080 max_height=1080 format=YU12,YU12 exclusive_caps=1,1 card_label=Phone,Laptop debug=1
  '';

	boot.kernelModules = [ "kvm-intel" "v4l2loopback" ];
	boot.initrd.kernelModules = [ "amdgpu" ];

  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];

	fileSystems."/mnt/hitachi" = lib.mkForce {
		device = "/dev/disk/by-id/ata-Hitachi_HTS547550A9E384_J2260056GD9SXC-part1";
		options = [ "defaults" "nofail"];
		fsType = "ext4";
	};

	fileSystems."/mnt/toshiba" = lib.mkForce {
		device = "/dev/disk/by-id/ata-TOSHIBA_HDWD120_Y831YZJAS-part1";
		options = [ "defaults" "nofail"];
		fsType = "ext4";
	};

	fileSystems."/boot" = lib.mkForce {
		device = "/dev/disk/by-id/nvme-NVME_SSD_512GB_GSMD22A0900736-part1";
		options = [ "fmask=0022" "dmask=0022" ];
		fsType = "vfat";
	};

	fileSystems."/" = lib.mkForce {
		device = "/dev/disk/by-id/nvme-NVME_SSD_512GB_GSMD22A0900736-part2";
		fsType = "ext4";
	};

	swapDevices = [ ];

	hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	networking.useDHCP = lib.mkDefault true;
}
