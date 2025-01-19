{
  image = "linuxserver/radarr:latest";
  hostname = "radarr";

  volumes = [
    "/mnt/toshiba/jellyfin/configs/radarr:/config"
    "/mnt/toshiba/jellyfin/downloads:/downloads"
    "/mnt/toshiba/jellyfin/movies:/movies"
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
