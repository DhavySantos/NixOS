{
  disko.devices.disk.root = {
    device = "/dev/disk/by-id/nvme-NVME_SSD_512GB_GSMD22A0900736";
    content.type = "gpt";
    type = "disk";

    content.partitions.esp = {
      size = "1024M";
      type = "EF00";

      content = {
        mountOptions = [ "umask=0077" ];
        mountpoint = "/boot";
        type = "filesystem";
        format = "vfat";
      };
    };

    content.partitions.root = {
      content.settings.allowDiscards = true;
      content.name = "crypted";
      content.type = "luks";
      size = "100%";

      content.content = {
        extraArgs = [ "-f" ];
        enableQuota = true;
        type = "btrfs";

        subvolumes = {
          "@root" = {
            mountOptions = [ "compress=zstd" "noatime" ];
            mountpoint = "/";
          };

          "@home" = {
            mountOptions = [ "compress=zstd" "noatime" ];
            mountpoint = "/home";
          };
        };
      };
    };
  };
}
