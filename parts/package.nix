{
  inputs,
  self,
  ...
}:
{
  perSystem =
    { system, ... }:
    let
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      module = import (self + "/config");
      utils = import (self + "/utils");

      nixvimModuleFull = {
        inherit pkgs module;
        extraSpecialArgs = {
          inherit utils;
          autoInstallFormatters = true;
        };
      };
      nixvimModuleBasic = {
        inherit pkgs module;
        extraSpecialArgs = {
          inherit utils;
          autoInstallFormatters = false;
        };
      };

      config = inputs.nixvim.lib.evalNixvim {
        inherit system;
        modules = [ module ];
        extraSpecialArgs = {
          inherit utils;
          autoInstallFormatters = false;
        };
      };

      packages = {
        default = packages.fullyFeatured;
        fullyFeatured = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule nixvimModuleFull;
        basic = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule nixvimModuleBasic;
        # initLua = pkgs.writeText "init.lua" config.config.content;  # TODO: Figure out how to output init.lua without nix store reliance
      };
    in
    {
      inherit packages;
    };
}
