{ pkgs, inputs, ... } : let
  wallpaper = pkgs.fetchurl {
    url = "https://gruvbox-wallpapers.pages.dev/wallpapers/irl/village.jpg";
    hash = "sha256-t3ItqKeewcpGLoyFG4ch23stzGpaujFfANM++Aj3SDM";
  };
in {
  imports = [ inputs.stylix.homeManagerModules.stylix ];
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";

  stylix.cursor.package = pkgs.apple-cursor;
  stylix.cursor.name = "macOS-White";
  stylix.cursor.size = 24;

  stylix.image = wallpaper;
  stylix.enable = true;

  home.pointerCursor = {
    package = pkgs.apple_cursor;
    name = "macOS-White";
    gtk.enable = true;
  };

  gtk.iconTheme = {
    package = pkgs.gruvbox-dark-icons-gtk;
    name = "gruvbox-dark";
  };

  gtk.font = {
    package = pkgs.cascadia;
    name = "Cascadia Code NF";
    size = 12;
  };
}
