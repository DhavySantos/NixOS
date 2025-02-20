{ ... } : {
  virtualisation.oci-containers.backend = "docker";
  virtualisation.docker.enable = true;

  virtualisation.oci-containers.containers = {
    sonarr = import ./containers/sonarr.nix;
    radarr = import ./containers/radarr.nix;
    prowlarr = import ./containers/prowlarr.nix;
    jellyfin = import ./containers/jellyfin.nix;
    transmission = import ./containers/transmission.nix;
    flaresolverr = import ./containers/flaresolverr.nix;

    minecraft = import ./containers/minecraft.nix;
  };
}
