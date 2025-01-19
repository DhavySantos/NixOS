{
  image = "linuxserver/transmission:latest";
  hostname = "transmission";

  volumes = [
    "/mnt/toshiba/jellyfin/configs/transmission:/config"
      "/mnt/toshiba/jellyfin/downloads:/downloads"
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
