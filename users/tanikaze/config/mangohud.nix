{ lib, ... } : {
  programs.mangohud.enable = true;
  programs.mangohud.settings = lib.mkForce {
    frame_timing = 0;
    frametime = 0;

    background_alpha = "0.0";
    hud_no_margin = 1;
    horizontal = 1;
    table_columns = 1;

    gpu_load_change = 1;
    gpu_text = "Rx580";
    gpu_temp = 1;

    cpu_load_change = 1;
    cpu_text = "i5-9400F";
    cpu_temp = 1;
  };
}
