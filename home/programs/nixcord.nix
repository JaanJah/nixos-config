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
      # https://github.com/KaylorBen/nixcord/blob/cc750b99c76c83809cb7e492cab6930c610faa64/docs/plugins.md
      plugins = {
        # Defaults, don't touch these unless you know what you're doing
        chatInputButtonAPI.enable = true;
        commandsAPI.enable = true;
        crashHandler.attemptToPreventCrashes = true;
        crashHandler.enable = true;
        memberListDecoratorsAPI.enable = true;
        messageAccessoriesAPI.enable = true;
        messageDecorationsAPI.enable = true;
        messageEventsAPI.enable = true;
        messagePopoverAPI.enable = true;
        messageUpdaterAPI.enable = true;
        serverListAPI.enable = true;
        userSettingsAPI.enable = true;

        # Plugins
        copyFileContents.enable = true;
        emoteCloner.enable = true;
        experiments.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        friendsSince.enable = true;
        imageZoom.enable = true;
        messageLogger.enable = true;
        noOnboardingDelay.enable = true;
        noUnblockToJump.enable = true;
        permissionsViewer.enable = true;
        showHiddenChannels.enable = true;
        sortFriendRequests.enable = true;
        showHiddenThings.enable = true;
        showTimeoutDuration.enable = true;
        spotifyCrack.enable = true;
        translate.enable = true;
        validReply.enable = true;
        validUser.enable = true;
        whoReacted.enable = true;
        youtubeAdblock.enable = true;
      };
    };
  };
}
