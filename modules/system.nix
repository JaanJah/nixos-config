{
  lib,
  pkgs,
  username,
  ...
}:
{
  time.timeZone = "Europe/Tallinn";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "et_EE.UTF-8";
      LC_IDENTIFICATION = "et_EE.UTF-8";
      LC_MEASUREMENT = "et_EE.UTF-8";
      LC_MONETARY = "et_EE.UTF-8";
      LC_NAME = "et_EE.UTF-8";
      LC_NUMERIC = "et_EE.UTF-8";
      LC_PAPER = "et_EE.UTF-8";
      LC_TELEPHONE = "et_EE.UTF-8";
      LC_TIME = "et_EE.UTF-8";
    };
  };

  console.keyMap = "et";

  fonts = {
    packages = with pkgs; [
      nerd-fonts.caskaydia-mono
      # Add fonts that support chinese/japanese/korean characters
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
    ];
  };

  nix = {
    gc = {
      automatic = lib.mkDefault true;
      dates = lib.mkDefault "weekly";
      options = lib.mkDefault "--delete-older-than 7d";
    };
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
  nixpkgs.config.allowUnfree = true;

  services = {
    desktopManager.plasma6.enable = true;
    displayManager = {
      autoLogin = {
        enable = true;
        user = username;
      };
      sddm.enable = true;
    };
    xserver = {
      enable = false;
      xkb = {
        layout = "ee";
        variant = "";
      };
    };
  };
}
