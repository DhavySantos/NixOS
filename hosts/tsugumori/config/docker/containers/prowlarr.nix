{
  image = "linuxserver/prowlarr:latest";
  hostname = "prowlarr";

  volumes = [
    "/mnt/toshiba/containers/jellyfin/configs/prowlarr:/config"
  ];

  environment = {
    TZ = "America/Sao_Paulo";
    PUID = "1000";
    PGID = "26";
  };

  extraOptions = [
    "--network=docker1"
    "--ip=172.18.1.4"
  ];
}
