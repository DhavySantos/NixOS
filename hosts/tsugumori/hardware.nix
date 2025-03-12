{ modulesPath, system, config, pkgs, lib, ... }:

{
  imports = [ "${modulesPath}/installer/scan/not-detected.nix" ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.kernelParams = [ "amdgpu.ppfeaturemask=0xFFF7FFFF" ];
  boot.kernelModules = [ "kvm-intel" "v4l2loopback" ];
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="Droidcam" exclusive_caps=1
  '';

  fileSystems."/boot" = lib.mkForce {
    device = "/dev/disk/by-id/nvme-NVME_SSD_512GB_GSMD22A0900736-part1";
    options = [ "fmask=0022" "dmask=0022" ];
    fsType = "vfat";
  };

  fileSystems."/" = lib.mkForce {
    device = "/dev/mapper/root";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."root" = {
    device = "/dev/disk/by-id/nvme-NVME_SSD_512GB_GSMD22A0900736-part2";
    preLVM = true;
  };

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  nixpkgs.hostPlatform = lib.mkDefault system;
  networking.useDHCP = lib.mkDefault true;
}
