{
  image = "linuxserver/jellyfin:latest";
  hostname = "jellyfin";

  volumes = [
    "/mnt/toshiba/containers/jellyfin/configs/jellyfin:/config"
    "/mnt/toshiba/containers/jellyfin/movies:/movies"
    "/mnt/toshiba/containers/jellyfin/shows:/shows"
  ];

  environment = {
    TZ = "America/Sao_Paulo";
    PUID = "1000";
    PGID = "26";
  };

  extraOptions = [
    "--device=/dev/dri:/dev/dri"
    "--network=docker1"
    "--ip=172.18.1.1"
  ];
}
