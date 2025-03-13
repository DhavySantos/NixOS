{ pkgs, ... }:

{
  systemd.services.lact = {
    serviceConfig.ExecStart = "${pkgs.lact}/bin/lact daemon";
    description = "AMDGPU Control Daemon";
    wantedBy = ["multi-user.target"];
    after = ["multi-user.target"];
    enable = true;
  };

  systemd.services.cpupower = {
    description = "Set CPU performance level";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.linuxPackages_latest.cpupower}/bin/cpupower frequency-set -d 4.1GHz";
      RemainAfterExit = true;
      Type = "oneshot";
    };
  };

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      X11Forwarding = true;
    };
  };
}
