# nixos-config

This repo contains my NixOS config I use on my home machine.

## Usage

```sh
# Install pre-commit hooks
nix develop
# Symlink flake.nix and flake.lock
sudo ln -s ~/nixos-config/flake.nix /etc/nixos/flake.nix
sudo ln -s ~/nixos-config/flake.lock /etc/nixos/flake.lock
# Rebuild system
sudo nixos-rebuild switch
# Update flake.lock
sudo nix flake update
# Run pre-commit hook locally
nix flake check
```

TODO:

- Add docs for troubleshooting
- Add separate legacy boot mode and UEFI boot mode config
- Add commands how to properly clone and setup on new machine
- Add docs on what are the extra commands needed to run to setup new machine

Personal notes:

- Good structure from https://github.com/ryan4yin/nix-config/tree/i3-kickstarter
