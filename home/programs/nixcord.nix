{
  # https://github.com/KaylorBen/nixcord/blob/cc750b99c76c83809cb7e492cab6930c610faa64/docs/INDEX.md
  programs.nixcord = {
    enable = true;
    discord = {
      enable = false;
    };
    vesktop = {
      enable = true;
    };
    config = {
      plugins = {
        chatInputButtonAPI = {
          enable = true;
        };
        commandsAPI = {
          enable = true;
        };
        memberListDecoratorsAPI = {
          enable = true;
        };
        messageAccessoriesAPI = {
          enable = true;
        };
        messageDecorationsAPI = {
          enable = true;
        };
        messageEventsAPI = {
          enable = true;
        };
        messagePopoverAPI = {
          enable = true;
        };
        messageUpdaterAPI = {
          enable = true;
        };
        serverListAPI = {
          enable = true;
        };
        userSettingsAPI = {
          enable = true;
        };
        crashHandler = {
          enable = true;
          attemptToPreventCrashes = true;
        };
      };
    };
  };
}
