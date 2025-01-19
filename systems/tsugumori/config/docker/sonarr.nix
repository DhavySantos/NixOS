{
  image = "linuxserver/sonarr:latest";
  hostname = "sonarr";

  volumes = [
    "/mnt/toshiba/jellyfin/configs/sonarr:/config"
    "/mnt/toshiba/jellyfin/downloads:/downloads"
    "/mnt/toshiba/jellyfin/shows:/shows"
  ];

  environment = {
    TZ = "America/Sao_Paulo";
    PUID = "1000";
    PGID = "26";
  };

  extraOptions = [
    "--network=docker1"
    "--ip=172.18.1.2"
  ];
}
