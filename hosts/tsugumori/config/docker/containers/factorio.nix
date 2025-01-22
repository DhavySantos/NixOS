{
  image = "factoriotools/factorio:2.0.30";
  hostname = "factorio";

  volumes = [
    "/mnt/toshiba/containers/factorio:/factorio"
  ];

  extraOptions = [
    "--network=docker1"
    "--ip=172.18.2.1"
  ];
}
