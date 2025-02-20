{
  image = "linuxserver/jellyfin:latest";
  hostname = "jellyfin";

  volumes = [
    "/mnt/toshiba/containers/jellyfin/config/jellyfin:/config"
    "/mnt/toshiba/containers/jellyfin/movies:/movies"
    "/mnt/toshiba/containers/jellyfin/shows:/shows"
  ];

  environment = {
    TZ = "America/Sao_Paulo";
    PUID = "1000";
    PGID = "26";
  };

  ports = [
    "8096:8096"
  ];

  extraOptions = [
    "--device=/dev/dri:/dev/dri"
  ];
}
