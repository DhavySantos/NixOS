{ pkgs, inputs, ... } : let 

wallpaper = pkgs.fetchurl {
  url = "https://gruvbox-wallpapers.pages.dev/wallpapers/irl/cactus.png";
  hash = "sha256-oo2ZOfo3a5lSATOamg4yS/pdMoEQUySy5M6PbF0VV7M=";
};

in {
	imports = [ inputs.stylix.homeManagerModules.stylix ];

	stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";

	stylix.cursor.package = pkgs.apple-cursor;
	stylix.cursor.name = "macOS-White";
	stylix.cursor.size = 24;

	stylix.image = wallpaper;

	stylix.enable = true;
}
