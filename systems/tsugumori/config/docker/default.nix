{ pkgs, ... } : {
  virtualisation.docker.daemon.settings.iptables = false;
  virtualisation.oci-containers.backend = "docker";
  virtualisation.docker.enable = true;

  systemd.services."docker-network-docker1" = {
    serviceConfig.Type = "oneshot";

    after = [ "docker.service" ];

    wantedBy = [
      "docker-sonarr.service"
      "docker-radarr.service"
      "docker-jellyfin.service"
      "docker-prowlarr.service"
      "docker-flaresolverr.service"
      "docker-transmission.service"
    ];

    script = ''
      ${pkgs.docker}/bin/docker network inspect docker1 > /dev/null 2>&1 || ${pkgs.docker}/bin/docker network create \
      --opt com.docker.network.bridge.name=docker1 \
      --subnet 172.18.0.0/16 docker1
    '';
  };

  virtualisation.oci-containers.containers = {
    transmission = import ./transmission.nix;
    flaresolverr = import ./flaresolverr.nix;
    jellyfin = import ./jellyfin.nix;
    prowlarr = import ./prowlarr.nix;
    sonarr = import ./sonarr.nix;
    radarr = import ./radarr.nix;
  };
}
