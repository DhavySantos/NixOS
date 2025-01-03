{ pkgs, ... } : {
  virtualisation.docker.daemon.settings.iptables = false;
  virtualisation.docker.daemon.settings.bridge = "none";
  virtualisation.docker.enable = true;

  virtualisation.oci-containers.backend = "docker";
  virtualisation.oci-containers.containers = {
    jellyfin = {
      image = "linuxserver/jellyfin:latest";
      hostname = "jellyfin";

      volumes = [
        "/mnt/hitachi/jellyfin/configs/jellyfin:/config"
        "/mnt/hitachi/jellyfin/movies:/movies"
        "/mnt/hitachi/jellyfin/shows:/shows"
      ];

      extraOptions = [
        "--device=/dev/dri:/dev/dri"
        "--network=docker0"
        "--ip=172.17.1.1"
      ];
    };

    sonarr = {
      image = "linuxserver/sonarr:latest";
      hostname = "sonarr";

      volumes = [
        "/mnt/hitachi/jellyfin/configs/sonarr:/config"
        "/mnt/hitachi/jellyfin/downloads:/downloads"
        "/mnt/hitachi/jellyfin/shows:/shows"
      ];

      environment = {
        "TZ" = "America/Sao_Paulo";
        "PGID" = "1000";
        "PUID" = "1001";
      };

      extraOptions = [
        "--network=docker0"
        "--ip=172.17.1.2"
      ];
    };

    radarr = {
      image = "linuxserver/radarr:latest";
      hostname = "radarr";

      volumes = [
        "/mnt/hitachi/jellyfin/configs/radarr:/config"
        "/mnt/hitachi/jellyfin/downloads:/downloads"
        "/mnt/hitachi/jellyfin/movies:/movies"
      ];

      environment = {
        "TZ" = "America/Sao_Paulo";
        "PGID" = "1000";
        "PUID" = "1001";
      };

      extraOptions = [
        "--network=docker0"
        "--ip=172.17.1.3"
      ];
    };

    prowlarr = {
      image = "linuxserver/prowlarr:latest";
      hostname = "prowlarr";

      volumes = [
        "/mnt/hitachi/jellyfin/configs/prowlarr:/config"
      ];

      environment = {
        "TZ" = "America/Sao_Paulo";
        "PGID" = "1000";
        "PUID" = "1001";
      };

      extraOptions = [
        "--network=docker0"
        "--ip=172.17.1.4"
      ];
    };

    flaresolverr = {
      image = "flaresolverr/flaresolverr:latest";
      hostname = "flaresolverr";

      environment = {
        "TZ" = "America/Sao_Paulo";
        "PGID" = "1000";
        "PUID" = "1001";
      };

      extraOptions = [
        "--network=docker0"
        "--ip=172.17.1.5"
      ];
    };

    transmission = {
      image = "linuxserver/transmission:latest";
      hostname = "transmission";

      volumes = [
        "/mnt/hitachi/jellyfin/configs/transmission:/config"
        "/mnt/hitachi/jellyfin/downloads:/downloads"
      ];

      environment = {
        "TZ" = "America/Sao_Paulo";
        "PGID" = "1000";
        "PUID" = "1001";
      };

      extraOptions = [
        "--network=docker0"
        "--ip=172.17.1.6"
      ];
    };

    vaultwarden = {
      image = "vaultwarden/server:latest";
      hostname = "vaultwarden";

      volumes = [
        "vaultwarden:/data"
      ];

      extraOptions = [
        "--network=docker0"
        "--ip=172.17.0.2"
      ];
    };
  };

  systemd.services."docker-network-docker0" = {
    serviceConfig.Type = "oneshot";

    after = [ "docker.service" ];

    wantedBy = [
      "docker-sonarr.service"
      "docker-radarr.service"
      "docker-jellyfin.service"
      "docker-prowlarr.service"
      "docker-transmission.service"
      "docker-vaultwarden.service"
    ];

    script = ''
      ${pkgs.docker}/bin/docker network inspect docker0 > /dev/null 2>&1 || ${pkgs.docker}/bin/docker network create \
      --subnet 172.17.0.0/16 docker0
    '';
  };
}
