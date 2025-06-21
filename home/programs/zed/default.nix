{
  pkgs,
  ...
}:
{
  programs.zed-editor = {
    enable = true;
    # https://zed.dev/extensions
    extensions = [
      # Language Servers
      #"discord-presence" # Requires rust to be installed
      "html"
      "git-firefly"
      "nix"
      "sql"

      # Themes
      "catppuccin"

      # Icon Themes
      "catppuccin-icons"
    ];
    extraPackages = with pkgs; [
      # Nix language server dependencies
      nil
      nixd

      # Go packages
      go
      gopls

      # Markdown language server
      marksman

      # Package.json language server
      package-version-server

      # Node.js packages
      nodejs
    ];
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
        dark = "Catppuccin Mocha - No Italics";
      };
      icon_theme = {
        mode = "system";
        light = "Zed";
        dark = "Catppuccin Mocha";
      };
      calls = {
        mute_on_join = true;
      };
      format_on_save = "on";
      git = {
        inline_blame = {
          enabled = false;
        };
      };
      languages = {
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
