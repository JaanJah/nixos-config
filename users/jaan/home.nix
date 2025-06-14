{
  imports = [
    ../../home/core.nix

    ../../home/programs
  ];
  # https://github.com/nix-community/home-manager/tree/release-25.05/modules/programs
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
