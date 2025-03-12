{ pkgs, ... }:

{
  systemd.services.lact = {
    serviceConfig.ExecStart = "${pkgs.lact}/bin/lact daemon";
    description = "AMDGPU Control Daemon";
    wantedBy = ["multi-user.target"];
    after = ["multi-user.target"];
    enable = true;
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
