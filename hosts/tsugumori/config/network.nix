{ lib, ... } : {
  networking.nftables.ruleset = builtins.readFile ../files/nftables.conf;
  networking.nftables.flushRuleset = false;
  networking.nftables.enable = true;

  networking.nameservers = lib.mkForce [ "1.1.1.1" "8.8.8.8" ];
  networking.networkmanager.enable = true;
  networking.hostName = "tsugumori";

  networking.firewall.enable = false;
  networking.nat.enable = false;

  networking.wireguard.interfaces."tun0" = {
    privateKeyFile = "/etc/wireguard/privatekey";
    generatePrivateKeyFile = true;
    ips = [ "10.0.0.2/24" ];

    peers = [{
      presharedKey = "9ydRRQJ7Bh0APXBTzYyr2Pg1zWu5wH744XG8J0BLNEo=";
      publicKey = "rhUeNt9HncVvLWU28F7RtOVmJglT3ulCr/hRygFIEFI=";
      endpoint = "wireguard.tsugumori.cloud:51820";
      allowedIPs = [ "10.0.0.0/24" ];
      persistentKeepalive = 25;
    }];
  };

  boot.kernel.sysctl."net.ipv4.conf.all.forwarding" = true;

  services.udev.extraRules = ''
    SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="18:c0:4d:f4:a7:a6", NAME="eth0"
    SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="00:e0:4c:68:06:61", NAME="eth1"
  '';
}
