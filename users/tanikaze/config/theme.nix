{ pkgs, inputs, ... } : let

wallpaper = pkgs.fetchurl {
  url = "https://i.imgur.com/5ALLimu.jpeg";
  hash = "sha256-7/lzW5BfpC1yF1NwOXnTZ/+IXMavK+Vd71bYQBfUqEA=";
};

in {
  imports = [ inputs.stylix.homeManagerModules.stylix ];
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
  stylix.polarity = "dark";

  stylix.cursor.package = pkgs.apple-cursor;
  stylix.cursor.name = "macOS-White";
  stylix.cursor.size = 24;

  stylix.targets.neovim.enable = false;
  stylix.image = wallpaper;
  stylix.enable = true;
}
