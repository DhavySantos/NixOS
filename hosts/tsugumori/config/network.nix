{ lib, ... } : {
	networking.nftables.ruleset = builtins.readFile ../files/nftables.conf;
	networking.nftables.enable = true;

  networking.hosts."138.186.41.120" = [
    "jellyfin.tsugumori.cloud"
    "prowlarr.tsugumori.cloud"
    "sonarr.tsugumori.cloud"
    "radarr.tsugumori.cloud"
  ];

	networking.nameservers = lib.mkForce [ "1.1.1.1" "8.8.8.8" ];
	networking.networkmanager.enable = true;
	networking.hostName = "tsugumori";

	networking.firewall.enable = false;
	networking.nat.enable = false;

	boot.kernel.sysctl = { "net.ipv4.conf.all.forwarding" = true; };

	services.udev.extraRules = ''
		SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="18:c0:4d:f4:a7:a6", NAME="wan0"
		SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="00:e0:4c:68:06:61", NAME="lan0"
	'';
}
