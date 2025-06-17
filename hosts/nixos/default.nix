# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:
{
  imports = [
    # Import modules
    # TODO: Make modules toggleable by variables
    ../../modules/amd.nix
    ../../modules/audio.nix
    ../../modules/boot.nix
    ../../modules/network.nix
    #../../modules/nvidia.nix
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

  environment.systemPackages = with pkgs; [
    bitwarden-desktop

    # Nix language server dependencies
    nil
    nixd

    # Go packages
    go
    gopls

    # Markdown language server
    marksman

    # Node.js packages
    nodejs

    nixfmt-rfc-style
    ncdu
    kitty
    spotify
    tree
    unzip

    # Wine stuff
    wineWowPackages.stable
    winetricks

    # Packages needed for screenshot
    (flameshot.override { enableWlrSupport = true; })
    kdePackages.xdg-desktop-portal-kde

    kdePackages.kate
    kdePackages.okular
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
