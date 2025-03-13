{ modulesPath, system, config, pkgs, lib, ... }:

{
  imports = [ "${modulesPath}/installer/scan/not-detected.nix" ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.kernelParams = [ "amdgpu.ppfeaturemask=0xFFF7FFFF" ];
  boot.kernelModules = [ "kvm-intel" "v4l2loopback" ];
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.supportedFilesystems = [ "btrfs" ];

  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];

  boot.extraModprobeConfig = ''
    options v4l2loopback video_nr=2,3 width=640,1920 max_width=1920 height=480,1080 max_height=1080 format=YU12,YU12 exclusive_caps=1,1 card_label=Phone,Laptop debug=1
  '';

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  nixpkgs.hostPlatform = lib.mkDefault system;
  networking.useDHCP = lib.mkDefault true;
}
