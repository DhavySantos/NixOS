{ lib, ... } : {
  programs.mangohud.enableSessionWide = true;
  programs.mangohud.enable = true;
  programs.mangohud.settings = {
    background_alpha = lib.mkForce 0.0;
    table_columns = 1;
    frame_timing = 0;
    horizontal = 1;
    frametime = 0;
  };
}
