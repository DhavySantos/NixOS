{ pkgs, inputs, ... } : {
	imports = [ inputs.stylix.homeManagerModules.stylix ];

	stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";

	stylix.cursor.package = pkgs.apple-cursor;
	stylix.cursor.name = "macOS-White";
	stylix.cursor.size = 24;

	stylix.image = ../../files/wallpaper.png;

	stylix.enable = true;
}
