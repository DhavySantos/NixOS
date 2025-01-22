{
  image = "linuxserver/jellyfin:latest";
  hostname = "jellyfin";

  volumes = [
    "/mnt/toshiba/jellyfin/configs/jellyfin:/config"
    "/mnt/toshiba/jellyfin/movies:/movies"
    "/mnt/toshiba/jellyfin/shows:/shows"
  ];

  extraOptions = [
    "--device=/dev/dri:/dev/dri"
    "--network=docker1"
    "--ip=172.18.1.1"
  ];
}
