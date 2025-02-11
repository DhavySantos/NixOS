{ lib, ... } : {
  programs.mangohud.enableSessionWide = true;
  programs.mangohud.enable = true;
  programs.mangohud.settings = {
    background_alpha = lib.mkForce 0.0;
    table_columns = 1;
    fps_limit = 60;

    frame_timing = 1;
    frametime = 1;
    gpu_temp = 1;
    cpu_temp = 1;

    font_size = 12;
    horizontal = 1;

    toggle_hud = "Shift_R+F12";
    toggle_fps_limit = "Shift_L+F11";
  };
}
