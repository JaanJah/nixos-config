{
  config,
  pkgs,
  username,
  ...
}:
{
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    sessionPath = [
      "${config.home.homeDirectory}/.npm-global/bin"
    ];
    sessionVariables = {
      NPM_CONFIG_PREFIX = "${config.home.homeDirectory}/.npm-global";
    };
    packages = with pkgs; [
      nodejs_24
    ];
    stateVersion = "25.05";
  };
  programs.home-manager.enable = true;
}
