{ pkgs
, username
, ...
}: {
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

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-mono
  ];


  services = {
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

  services.desktopManager.plasma6.enable = true;
}
