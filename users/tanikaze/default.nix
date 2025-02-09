{ pkgs, inputs, ... } : {

  users.users.tanikaze = {
    extraGroups = [ "wheel" "uinput" "input" ];
    description = "tanikaze";
    isNormalUser = true;
  };

  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager.extraSpecialArgs = {
    inherit inputs;
  };

  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;

  home-manager.users.tanikaze = {
    imports = [
      ./config/mangohud.nix
      ./config/xremap.nix
      ./config/shell.nix
      ./config/theme.nix
      ./config/hyprland
    ];

    home.homeDirectory = "/home/tanikaze";
    home.stateVersion = "24.11";
    home.username = "tanikaze";

    home.sessionVariables = {
      EDITOR = "nvim";
    };

    xdg.desktopEntries.steam_gamescope = {
      exec = with pkgs; "${gamescope}/bin/gamescope -w 1920 -h 1080 -e -f -r 60 --force-grab-cursor -- ${steam}/bin/steam -gamepadui"
      name = "Steam: BigPicture";
      terminal = false;
      icon = "steam";
    };


    xdg.desktopEntries.lutris_gamescope = {
      exec = with pkgs; "${gamescope}/bin/gamescope -w 1920 -h 1080 -e -f -r 60 --force-grab-cursor -- ${lutris}/bin/lutris"
      name = "Lutris: Gamescope";
      terminal = false;
      icon = "lutris";
    };

    programs.git.enable = true;
    programs.git.extraConfig = {
      user.email = "dhavysantos@gmail.com";
      init.defaultBranch = "main";
      user.name = "Dhavy Santos";
    };

    programs = {
      lazygit.enable = true;
      neovim.enable = true;
      btop.enable = true;
      yazi.enable = true;
    };

    home.packages = (with pkgs; [
      vesktop google-chrome spotify
      droidcam unrar ripgrep p7zip
      unzip
    ]);

    nixpkgs.config.allowUnfree = true;
  };
}
