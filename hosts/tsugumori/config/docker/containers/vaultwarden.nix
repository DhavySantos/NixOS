{
  image = "vaultwarden/server:latest";
  hostname = "vaultwarden";

  volumes = [
    "vaultwarden:/data"
  ];

  extraOptions = [
    "--network=docker1"
    "--ip=172.18.1.7"
  ];
}
