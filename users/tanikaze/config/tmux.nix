{ pkgs, ... } : let 

tpm = pkgs.fetchFromGitHub {
  sha256 = "sha256-hW8mfwB8F9ZkTQ72WQp/1fy8KL1IIYMZBtZYIwZdMQc";
  rev = "99469c4a9b1ccf77fade25842dc7bafbc8ce9946";
  owner = "tmux-plugins";
  repo = "tpm";
};

in {
  home.file.".config/tmux/plugins/tpm" = {
    recursive = true;
    source = tpm;
  };

	programs.tmux = {
		extraConfig = builtins.readFile ../files/tmux.conf;
		shell = "${pkgs.zsh}/bin/zsh";
		enable = true;
	};
}
