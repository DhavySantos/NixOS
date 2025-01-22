{
  image = "linuxserver/transmission:latest";
  hostname = "transmission";

  volumes = [
    "/mnt/toshiba/containers/jellyfin/configs/transmission:/config"
    "/mnt/toshiba/containers/jellyfin/downloads:/downloads"
  ];

  environment = {
    TZ = "America/Sao_Paulo";
    PUID = "1000";
    PGID = "26";
  };

  extraOptions = [
    "--network=docker1"
      "--ip=172.18.1.6"
      ];
}
