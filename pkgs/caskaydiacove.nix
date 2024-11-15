{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
	name = "caskaydiacove";

	phases = ["installPhase"];

	src = pkgs.fetchurl {
		url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.tar.xz";
		sha256 = "5af79aaebec3aa474c801e48aa2cb901cf1e9c03cbb3b6c189fed439e867e6e9";
	};

	installPhase = ''
		mkdir -p $out/share/fonts/truetype
		tar -xf $src -C $out/share/fonts/truetype
	'';
}
