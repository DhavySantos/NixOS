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

	boot.initrd.kernelModules = [ "amdgpu" ];
	boot.kernelModules = [ "kvm-intel" ];
	boot.extraModulePackages = [ ];

	fileSystems."/mnt/hitachi" = lib.mkForce {
		device = "/dev/disk/by-id/ata-Hitachi_HTS547550A9E384_J2260056GD9SXC-part1";
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

