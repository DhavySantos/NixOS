{
  disko.devices.disk.main = {
    device = "/dev/disk/by-id/nvme-NVME_SSD_512GB_GSMD22A0900736";
    content.type = "gpt";
    type = "disk";

    content.partitions.ESP = {
      type = "EF00";
      size = "512M";
      content.format = "vfat";
      content.type = "filesystem";
      content.mountpoint = "/boot";
      content.mountOptions = [ "umask=0077" ];
    };

    content.partitions.ROOT = {
      size = "100%";
      content.format = "ext4";
      content.mountpoint = "/";
      content.type = "filesystem";
    };
  };
}
