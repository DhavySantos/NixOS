{
  image = "flaresolverr/flaresolverr:latest";
  hostname = "flaresolverr";

  environment = {
    TZ = "America/Sao_Paulo";
    PUID = "1000";
    PGID = "26";
  };

  ports = [
    "8191:8191"
  ];
}
