{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
	name = "CascadiaCode";
  version = "3.2.1";

	phases = [ "installPhase" ];

	src = pkgs.fetchurl {
		url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/CascadiaCode.tar.xz";
		sha256 = "5af79aaebec3aa474c801e48aa2cb901cf1e9c03cbb3b6c189fed439e867e6e9";
	};

	installPhase = ''
		mkdir -p $out/share/fonts/truetype
		tar -xf $src -C $out/share/fonts/truetype
	'';

  meta = with pkgs.lib; {
    description = "Nerd Fonts is a project that patches developer targeted fonts with a high number of glyphs (icons).";
    homepage = "https://github.com/ryanoasis/nerd-fonts";
    maintainers = with maintainers; [ ryanccn ];
    platforms = platforms.all;
    license = licenses.mit;
  };
}
