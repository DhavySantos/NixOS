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
      "docker-factorio.service"
    ];

    script = ''
      ${pkgs.docker}/bin/docker network inspect docker1 > /dev/null 2>&1 || ${pkgs.docker}/bin/docker network create \
      --opt com.docker.network.bridge.name=docker1 \
      --subnet 172.18.0.0/16 docker1
    '';
  };

  virtualisation.oci-containers.containers = {
    jellyfin = import ./containers/jellyfin.nix; # 172.18.1.1
    sonarr = import ./containers/sonarr.nix; # 172.18.1.2
    radarr = import ./containers/radarr.nix; # 172.18.1.3
    prowlarr = import ./containers/prowlarr.nix; # 172.18.1.4
    flaresolverr = import ./containers/flaresolverr.nix; # 172.18.1.5
    transmission = import ./containers/transmission.nix; # 172.18.1.6
    vaultwarden = import ./containers/vaultwarden.nix; # 192.18.1.7
    factorio = import ./containers/factorio.nix; # 172.18.2.1
  };
}
