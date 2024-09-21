{ pkgs ? import <nixpkgs> {} } : let

	libs = with pkgs; [
		xorg.libX11 xorg.libXrandr xorg.libXi
		xorg.libXinerama xorg.libXcursor
		glfw libGLU libGL
	];

in pkgs.mkShell {

	buildInputs = with pkgs; libs ++ [
		cargo rustc rustfmt rust-analyzer
		gcc cmake gnumake pkg-config
	];

	shellHook = ''
		export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${pkgs.lib.makeLibraryPath libs}"
	'';
}
