# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  # inputs,
  pkgs,
  ...
}:
{
  imports = [
    # Import modules
    # TODO: Make modules toggleable by variables
    ../../modules/amd.nix
    ../../modules/audio.nix
    ../../modules/boot.nix
    ../../modules/network.nix
    #../../modules/nvidia.nix
    ../../modules/openvpn.nix
    ../../modules/podman.nix
    #../../modules/printer.nix
    ../../modules/system.nix
    #../../modules/touchpad.nix

    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos"; # Define your hostname.

  users.users.jaan = {
    isNormalUser = true;
    description = "jaan";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  programs.ssh.startAgent = true;
  programs.steam.enable = true;
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # Needed for RS3
      gtk2
      xorg.libSM
      xorg.libICE
      xorg.libX11
      xorg.libXxf86vm
      glib
      pango
      gdk-pixbuf
      cairo
      libcap
      # Permitted explicitly in system.nix
      openssl_1_1
      sdl2-compat
      mesa
      libglvnd
    ];
  };

  environment = {
    localBinInPath = true;
    systemPackages =
      # let
      #   stremioPkgs = import inputs.nixpkgs-for-stremio {
      #     inherit (pkgs) system;
      #   };
      # in
      with pkgs; [
        bc
        bitwarden-desktop
        nixfmt-rfc-style
        ncdu
        kitty
        openvpn
        spotify
        tree
        unzip
        dig
        git-lfs

        # For running OSRS
        jdk11

        rocketchat-desktop

        # Minecraft launcher
        prismlauncher

        # Runescape
        (bolt-launcher.override {
          # Launch options: /usr/bin/env SDL_VIDEODRIVER=x11 %command%
          # @link https://github.com/Adamcake/Bolt/issues/147#issue-3206473355
          enableRS3 = true;
        })
        runelite

        # For running FFXIV
        xivlauncher

        # https://github.com/0xAX/asm
        gnumake
        nasm
        binutils
        libgcc

        # See: https://github.com/NixOS/nixpkgs/issues/437992
        # FIXME: stremio is using older mpv with settings my system is unable to run, use web version instead
        # @link https://web.stremio.com/#/
        # (stremioPkgs.stremio)

        # Markdown language server
        marksman

        # Wine stuff
        wineWowPackages.stable
        winetricks

        kdePackages.kate
        kdePackages.okular
      ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
