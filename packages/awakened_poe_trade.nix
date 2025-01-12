{ pkgs ? import <nixpkgs> {} } :

let

pname = "awakened-poe-trade";
version = "3.25.102";

name = "${pname}-${version}";

src = pkgs.fetchurl {
  url = "https://github.com/SnosMe/awakened-poe-trade/releases/download/v${version}/Awakened-PoE-Trade-${version}.AppImage";
  hash = "sha256-lcdKJ+B8NQmyMsv+76+eeESSrfR/7Mq6svO5VKaoNUY=";
};

appimageContents = pkgs.appimageTools.extractType1 { inherit name src; };

in

pkgs.appimageTools.wrapType1 rec {
  inherit name src;

  extraInstallCommands = ''
    mv $out/bin/${name} $out/bin/${pname}
    install -m 444 -D ${appimageContents}/${pname}.desktop -t $out/share/applications
    substituteInPlace $out/share/applications/${pname}.desktop \
      --replace-fail 'Exec=AppRun' 'Exec=${pname}'
    cp -r ${appimageContents}/usr/share/icons $out/share
  '';

  meta = {
    description = "💲 🔨 Path of Exile trading app for price checking";
    homepage = "https://github.com/SnosMe/awakened-poe-trade";
    platforms = pkgs.lib.platforms.linux;
  };
}
