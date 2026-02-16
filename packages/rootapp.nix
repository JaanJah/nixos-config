{
  lib,
  fetchurl,
  appimageTools,
}:

let
  pname = "rootapp";
  version = "0.9.88";

  src = fetchurl {
    # nix store prefetch-file --json https://installer.rootapp.com/installer/Linux/X64/Root.AppImage
    url = "https://installer.rootapp.com/installer/Linux/X64/Root.AppImage";
    sha256 = "sha256-HKY/Jox7zFi1s0pTCM1UzFULlEQ/ElTF26kcpZGexts=";
  };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    install -Dm444 ${src} $out/share/${pname}/${pname}.AppImage
  '';

  meta = with lib; {
    description = "RootApp desktop application";
    homepage = "https://www.rootapp.com/";
    license = licenses.unfree;
    platforms = [ "x86_64-linux" ];
    maintainers = [ ];
  };
}
