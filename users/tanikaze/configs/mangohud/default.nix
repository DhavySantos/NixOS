{ lib, ... } : {
	programs.mangohud.enable = true;
	programs.mangohud.settings = {
		fps_limit = 60;
		gl_vsync = "1";
		vsync = "1";

		frame_timing= "0";
		frametime = false;
		gpu_temp = true;
		cpu_temp = true;
		fps = true;

		font_size = lib.mkForce 12;

		background_alpha = lib.mkForce "0.0";
		position = "top-left";
		horizontal = true;
		offset_x = "0";
		offset_y= "0";
	};
}
