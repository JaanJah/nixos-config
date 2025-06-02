{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jaan";
  home.homeDirectory = "/home/jaan";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      font_family = "CaskaydiaMono NFM Regular";
      bold_font = "CaskaydiaMono NFM Bold";
      italic_font = "CaskaydiaMono NFM Italic";
      bold_italic_font = "CaskaydiaMono NFM Bold Italic";
    };
  };
}

