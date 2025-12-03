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
      "dockerfile"
      "html"
      "git-firefly"
      "nix"
      "sql"
      "toml"

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

      # Package.json language server
      package-version-server
    ];
    userSettings = {
      agent = {
        default_model = {
          provider = "copilot_chat";
          model = "gpt-4.1";
        };
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
      theme = {
        mode = "system";
        light = "One Light";
        dark = "Catppuccin Mocha - No Italics";
      };
      icon_theme = {
        mode = "system";
        light = "Zed (Default)";
        dark = "Catppuccin Mocha";
      };
      calls = {
        mute_on_join = true;
      };
      # See: https://github.com/zed-industries/zed/pull/39400
      format_on_save = "off";
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
      lsp = {
        # https://github.com/xhyrom/zed-discord-presence/tree/v0.8.2?tab=readme-ov-file#example-configuration
        discord_presence = {
          initialization_options = {
            application_id = "1263505205522337886";
            base_icons_url = "https://raw.githubusercontent.com/xhyrom/zed-discord-presence/main/assets/icons/";
            state = "Working on {filename}";
            details = "In {workspace}";
            large_image = "{base_icons_url}/{language:lo}.png";
            large_text = "{language:u}";
            small_image = "{base_icons_url}/zed.png";
            small_text = "Zed";

            idle = {
              timeout = 300;
              action = "clear_activity";

              state = "Idling";
              details = "In Zed";
              large_image = "{base_icons_url}/zed.png";
              large_text = "Zed";
              small_image = "{base_icons_url}/idle.png";
              small_text = "Idle";
            };

            git_integration = false;
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
