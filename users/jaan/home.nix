{ inputs, ... }:
{
  # This file should only include imports
  imports = [
    ../../home/core.nix

    ../../home/programs

    inputs.quadlet-nix.homeManagerModules.quadlet
    # Command cheat-sheet for quadlets:
    # systemctl --user restart <container>.service
    # journalctl --user -u <container>.service -f
    # podman pause <container>
    # podman unpause <container>
    # podman ps --all | grep paused
    ../../containers/jellyfin.nix
    ../../containers/seerr.nix
  ];
}
