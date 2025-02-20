{
  image = "linuxserver/sonarr:latest";
  hostname = "sonarr";

  volumes = [
    "/mnt/toshiba/containers/jellyfin/config/sonarr:/config"
    "/mnt/toshiba/containers/jellyfin/downloads:/downloads"
    "/mnt/toshiba/containers/jellyfin/shows:/shows"
  ];

  environment = {
    TZ = "America/Sao_Paulo";
    PUID = "1000";
    PGID = "26";
  };

  ports = [
    "8989:8989"
  ];
}
