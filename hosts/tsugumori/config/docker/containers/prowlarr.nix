{
  image = "linuxserver/prowlarr:latest";
  hostname = "prowlarr";

  volumes = [
    "/mnt/toshiba/containers/jellyfin/config/prowlarr:/config"
  ];

  environment = {
    TZ = "America/Sao_Paulo";
    PUID = "1000";
    PGID = "26";
  };

  ports = [
    "9696:9696"
  ];
}
