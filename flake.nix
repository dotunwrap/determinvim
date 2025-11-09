{
  description = ''
    determinvim - a deterministic nvim configuration
  '';

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";

    nixvim = {
      url = "github:/nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;

      _module.args = { inherit inputs; };

      imports = [
        ./parts/package.nix
        ./parts/devshell.nix
        ./parts/checks.nix
      ];
    };
}
