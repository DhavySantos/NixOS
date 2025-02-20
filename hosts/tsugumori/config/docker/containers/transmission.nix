{
  image = "linuxserver/transmission:latest";
  hostname = "transmission";

  volumes = [
    "/mnt/toshiba/containers/jellyfin/config/transmission:/config"
    "/mnt/toshiba/containers/jellyfin/downloads:/downloads"
  ];

  environment = {
    TZ = "America/Sao_Paulo";
    PUID = "1000";
    PGID = "26";
  };

  ports = [
    "9091:9091"
  ];
}
