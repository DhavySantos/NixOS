{
  disko.devices.disk.main= {
    device = "/dev/disk/by-id/nvme-NVME_SSD_512GB_GSMD22A0900736";
    content.type = "gpt";
    type = "disk";

    content.partitions = {
      ESP = {
        type = "EF00";
        size = "500M";
        content.mountpoint = "/boot";
        content.type = "filesystem";
        content.format = "vfat";
      };

      root = {
        size = "100%";
        content.type = "filesystem";
        content.mountpoint = "/";
        content.format = "ext4";
      };
    };
  };
}
