{ inputs, ... } : {
  imports = [ inputs.xremap.homeManagerModules.default ];

  services.xremap.watch = true;
  services.xremap.withWlroots = true;
  services.xremap.config.keymap = [{
    name = "default";
    remap = {
      Alt-Shift-W = "Shift-7";
      Capslock = "Esc";
      Alt-D = "Right";
      Alt-A = "Left";
      Alt-S = "Down";
      Alt-W = "Up";
    };

    application.not = [
      "steam_app*"
      "gamescope"
    ];
  }];
}
