{
  image = "linuxserver/radarr:latest";
  hostname = "radarr";

  volumes = [
    "/mnt/toshiba/containers/jellyfin/config/radarr:/config"
    "/mnt/toshiba/containers/jellyfin/downloads:/downloads"
    "/mnt/toshiba/containers/jellyfin/movies:/movies"
  ];

  environment = {
    TZ = "America/Sao_Paulo";
    PUID = "1000";
    PGID = "26";
  };

  extraOptions = [
    "--network=docker1"
    "--ip=172.18.1.3"
  ];
}
