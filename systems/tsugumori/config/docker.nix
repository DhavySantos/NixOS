{ pkgs, ... } : {
  virtualisation.docker.daemon.settings.iptables = false;
  virtualisation.docker.enable = true;

  virtualisation.oci-containers.backend = "docker";
  virtualisation.oci-containers.containers = {
    vaultwarden = {
      image = "vaultwarden/server:latest";
      hostname = "vaultwarden";

      volumes = [
        "vaultwarden:/data"
      ];

      extraOptions = [
        "--network=docker1"
        "--ip=172.18.0.2"
      ];
    };

    nextcloud = {
      image = "linuxserver/nextcloud:latest";
      hostname = "nextcloud";

      environment = {
        TZ = "America/Sao_Paulo";
        PGID = "1000";
        PUID = "1000";
      };

      volumes = [
        "/mnt/hitachi/nextcloud/.config:/config"
        "/mnt/hitachi/nextcloud/data:/data"
      ];

      extraOptions = [
        "--network=docker1"
        "--ip=172.18.0.3"
      ];
    };

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
        "--network=docker1"
        "--ip=172.18.1.1"
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
        "--network=docker1"
        "--ip=172.18.1.2"
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
        "--network=docker1"
        "--ip=172.18.1.3"
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
        "--network=docker1"
        "--ip=172.18.1.4"
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
        "--network=docker1"
        "--ip=172.18.1.5"
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
        "--network=docker1"
        "--ip=172.18.1.6"
      ];
    };
  };

  systemd.services."docker-network-docker1" = {
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
      ${pkgs.docker}/bin/docker network inspect docker1 > /dev/null 2>&1 || ${pkgs.docker}/bin/docker network create \
      --opt com.docker.network.bridge.name=docker1 \
      --subnet 172.18.0.0/16 docker1
    '';
  };
}
