{ lib, ... } : {
  networking.nftables.ruleset = builtins.readFile ../files/nftables.conf;
  networking.nftables.enable = true;

  networking.nameservers = lib.mkForce [ "1.1.1.1" "8.8.8.8" ];
  networking.networkmanager.enable = true;
  networking.hostName = "tsugumori";

  networking.firewall.enable = false;
  networking.nat.enable = false;

  networking.wireguard.interfaces."tun0" = {
    privateKeyFile = "/etc/wireguard/privatekey";
    generatePrivateKeyFile = true;
    ips = [ "10.0.0.2/16" ];

    peers = [{
      presharedKey = "hDEBap5akJSZw7mogDQyqSksfb9ZabPtX5UYFiD2/qM=";
      publicKey = "GuIu1jowgt+VUF143Ln1Ksjxx51Ns7/LH4nUuRWNMm0=";
      endpoint = "tsugumori.cloud:51820";
      allowedIPs = [ "10.0.0.0/16" ];
    }];
  };

  boot.kernel.sysctl."net.ipv4.conf.all.forwarding" = true;

  services.udev.extraRules = ''
    SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="18:c0:4d:f4:a7:a6", NAME="eth0"
    SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="00:e0:4c:68:06:61", NAME="eth1"
  '';
}
