# TODO: Look into https://flake.parts
{
  description = "jaan's NixOS configuration";

  inputs = {
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:kaylorben/nixcord";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    pre-commit-hooks.url = "github:cachix/git-hooks.nix";
    quadlet-nix.url = "github:SEIAROTg/quadlet-nix";

    # qt5 has been flagged as unmaintained and insecure, so we must explicitly
    # permit its usage to run Stremio. However, since insecure packages are not
    # built by Hydra once marked with known vulnerabilities, we use a pinned,
    # older nixpkgs revision from before that change. This ensures Hydra can
    # provide prebuilt binaries, since building qt5 locally is too heavy.
    # See: https://github.com/NixOS/nixpkgs/issues/437992#issuecomment-3380880457
    nixpkgs-for-stremio.url = "nixpkgs/5135c59491985879812717f4c9fea69604e7f26f";

    hytale-launcher.url = "github:JPyke3/hytale-launcher-nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-index-database,
      quadlet-nix,
      home-manager,
      plasma-manager,
      ...
    }@inputs:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      nixosConfigurations = {
        nixos =
          let
            username = "jaan";
            specialArgs = {
              inherit username;
              inherit inputs;
            };
            system = "x86_64-linux";
          in
          nixpkgs.lib.nixosSystem {
            inherit specialArgs;
            inherit system;
            modules = [
              ./hosts/nixos
              nix-index-database.nixosModules.nix-index
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = inputs // specialArgs;
                home-manager.backupFileExtension = "bak";
                home-manager.sharedModules = [
                  inputs.nixcord.homeModules.nixcord
                  plasma-manager.homeModules.plasma-manager
                ];
                home-manager.users.${username} = import ./users/${username}/home.nix;
              }
              quadlet-nix.nixosModules.quadlet
            ];
          };
      };

      checks = forAllSystems (system: {
        pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            nixfmt-rfc-style = {
              enable = true;
              excludes = [
                "hardware-configuration\\.nix$"
                "plasma\\.nix$"
              ];
            };
            deadnix = {
              enable = true;
              excludes = [
                "hardware-configuration\\.nix$"
              ];
            };
          };
        };
      });

      # Enter a development shell with `nix develop`.
      # The hooks will be installed automatically.
      # Or run pre-commit manually with `nix develop -c pre-commit run --all-files`
      devShells = forAllSystems (system: {
        default =
          let
            pkgs = nixpkgs.legacyPackages.${system};
            inherit (self.checks.${system}.pre-commit-check) shellHook enabledPackages;
          in
          pkgs.mkShell {
            inherit shellHook;
            buildInputs = enabledPackages;
          };
      });
    };
}
