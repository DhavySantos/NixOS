{
  image = "openjdk:17";
  hostname = "minecraft";

  volumes = [
    "/mnt/toshiba/containers/minecraft:/server"
  ];

  ports = [
    "25565:25565"
    "62632:62632/udp"
  ];

  extraOptions = [
    "--memory=8192m"
    "--cpus=1"
  ];

  entrypoint = "/server/start.sh";
  workdir = "/server";
}
