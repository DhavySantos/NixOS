{ lib, ... } : {
  networking.nftables.ruleset = builtins.readFile ../files/nftables.conf;
  networking.nftables.flushRuleset = false;
  networking.nftables.enable = true;

  networking.nameservers = lib.mkForce [ "1.1.1.1" "8.8.8.8" ];
  networking.hostName = "tsugumori";

  networking.firewall.enable = false;
  networking.nat.enable = false;

  services.udev.extraRules = ''
    SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="18:c0:4d:f4:a7:a6", NAME="eth0"
    SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="00:e0:4c:68:06:61", NAME="eth1"
  '';
}
