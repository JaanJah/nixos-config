{
  config,
  pkgs,
  username,
  ...
}:
let
  rootapp = pkgs.callPackage ../packages/rootapp.nix { };
in
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
    # Read more about lowPrio: https://nixos.org/manual/nixpkgs/stable/#function-library-lib.meta.lowPrio
    packages = with pkgs; [
      nodejs_24
      python315
      (lib.meta.lowPrio python314)

      rootapp
    ];
    stateVersion = "25.05";
  };
  programs.home-manager.enable = true;
}
