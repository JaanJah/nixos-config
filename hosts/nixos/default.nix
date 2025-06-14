# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:
{
  imports = [
    ../../modules/amd.nix
    ../../modules/audio.nix
    ../../modules/boot.nix
    ../../modules/podman.nix
    ../../modules/system.nix
    ../../modules/network.nix
    #../../modules/nvidia.nix
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos"; # Define your hostname.

  # Configure console keymap
  console.keyMap = "et";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jaan = {
    isNormalUser = true;
    description = "jaan";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  programs.thunderbird.enable = true;
  programs.fish.enable = true;
  programs.ssh.startAgent = true;
  programs.bash = {
    shellInit = ''
      bind 'set enable-bracketed-paste off'
    '';
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };
  programs.htop.enable = true;
  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    bitwarden-desktop
    btop
    fastfetch

    # Nix language server dependencies
    nil
    nixd

    # Go packages
    go
    gopls

    # Node.js packages
    nodejs

    nixfmt-rfc-style
    ncdu
    kitty
    spotify
    tree
    zed-editor
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

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
