{
  lib,
  fetchurl,
  stdenv,
  makeWrapper,
  pkgs,
}:

let
  pname = "formationbuilderidle";
  version = "0.0.9 (q)";

  src = fetchurl {
    # nix store prefetch-file --json https://formationbuilderidle.com/Build/idle_rpg.x86_64
    url = "https://formationbuilderidle.com/Build/idle_rpg.x86_64";
    sha256 = "sha256-OqNV6R69zTfHYpcjZwv9qd3Z0Eb7bj+95UeBO8ZRbKI=";
  };

  runtimeLibs = with pkgs; [
    libX11
    libXcursor
    libXi
    libXrandr
    libXrender
    libXext
    libXfixes
    libXinerama
    libXxf86vm
    wayland
    libxkbcommon
    vulkan-loader
    alsa-lib
    pulseaudio
  ];
in
stdenv.mkDerivation {
  inherit pname version src;

  dontUnpack = true;
  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    mkdir -p $out/bin
    install -Dm755 $src $out/libexec/${pname}

    makeWrapper $out/libexec/${pname} $out/bin/${pname} \
      --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath runtimeLibs}"
  '';

  meta = with lib; {
    description = "Formation Builder Idle";
    homepage = "https://formationbuilderidle.com/";
    license = licenses.unfree;
    platforms = [ "x86_64-linux" ];
    maintainers = [ ];
  };
}
