{ inputs, ... }:
{
  # This file should only include imports
  imports = [
    ../../home/core.nix

    ../../home/programs

    inputs.quadlet-nix.homeManagerModules.quadlet
    ../../containers/jellyfin.nix
    ../../containers/seerr.nix
  ];
}
