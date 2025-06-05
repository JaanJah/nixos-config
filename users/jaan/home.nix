{ ... }:

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
  # https://wiki.nixos.org/wiki/Zed
  programs.zed-editor = {
    enable = true;
    extensions = [ "nix" ];
    userSettings = {
      agent = {
        default_model = {
          provider = "copilot_chat";
          model = "gpt-4.1";
        };
        version = "2";
      };
      base_keymap = "JetBrains";
      features = {
        edit_prediction_provider = "copilot";
      };
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      autosave = "on_focus_change";
      buffer_font_family = "CaskaydiaMono Nerd Font Mono";
      buffer_font_size = 14;
      buffer_font_features = {
        calt = false;
      };
      ui_font_family = "CaskaydiaMono Nerd Font Mono";
      ui_font_size = 14;
      hour_format = "hour24";
      theme = {
        mode = "system";
        light = "One Light";
        dark = "One Dark";
      };
      calls = {
        mute_on_join = true;
      };
      format_on_save = "on";
      languages = {
        # https://github.com/zed-industries/zed/issues/21680#issuecomment-2536751118
        Nix = {
          language_servers = [
            "nil"
            "!nixd"
          ];
          formatter = {
            external = {
              command = "nixfmt";
            };
          };
        };
      };
    };
    userKeymaps = [
      {
        context = "Workspace";
        bindings = { };
      }
      {
        context = "Editor";
        bindings = {
          super-k = "pane::SplitRight";
        };
      }
      {
        context = "Pane";
        bindings = { };
      }
    ];
  };
}
