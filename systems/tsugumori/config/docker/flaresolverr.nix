{
  image = "flaresolverr/flaresolverr:latest";
  hostname = "flaresolverr";

  environment = {
    TZ = "America/Sao_Paulo";
    PUID = "1000";
    PGID = "26";
  };

  extraOptions = [
    "--network=docker1"
    "--ip=172.18.1.5"
  ];
}
