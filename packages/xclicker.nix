{
  lib,
  fetchurl,
  appimageTools,
}:

let
  pname = "xclicker";
  version = "1.5.1";

  src = fetchurl {
    # Check latest here: https://github.com/robiot/xclicker/releases
    # nix store prefetch-file --json https://github.com/robiot/xclicker/releases/download/v1.5.1/xclicker_1.5.1_amd64.AppImage
    url = "https://github.com/robiot/xclicker/releases/download/v1.5.1/xclicker_1.5.1_amd64.AppImage";
    sha256 = "sha256-jvljP8ZoExOTSpByjiqfItKKnypTPBFezEJLPsRPnw0=";
  };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    install -Dm444 ${src} $out/share/${pname}/${pname}.AppImage
  '';

  meta = with lib; {
    description = "XClicker - Fast gui autoclicker for x11 linux desktops ";
    homepage = "https://xclicker.xyz/";
    license = licenses.unfree;
    platforms = [ "x86_64-linux" ];
    maintainers = [ ];
  };
}
