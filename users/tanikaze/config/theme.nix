{ pkgs, inputs, lib, ... } : let

wallpaper = pkgs.fetchurl {
  url = "https://gruvbox-wallpapers.pages.dev/wallpapers/irl/village.jpg";
  hash = "sha256-t3ItqKeewcpGLoyFG4ch23stzGpaujFfANM++Aj3SDM";
};

in {
  imports = [ inputs.stylix.homeManagerModules.stylix ];
  stylix.base16Scheme = "${inputs.schemes}/base16/gruvbox-dark-soft.yaml";
  stylix.polarity = "dark";

  stylix.cursor.package = pkgs.apple-cursor;
  stylix.cursor.name = "macOS-White";
  stylix.cursor.size = 24;

  stylix.targets.neovim.enable = false;
  stylix.image = wallpaper;
  stylix.enable = true;

  gtk.enable = true;

  gtk.iconTheme = {
    package = lib.mkForce pkgs.gruvbox-dark-icons-gtk;
    name = "gruvbox-dark";
  };
}
