{
  inputs,
  self,
  ...
}:
{
  perSystem =
    {
      pkgs,
      system,
      ...
    }:
    let
      nixvimModule = {
        module = import (self + "/config");
        inherit pkgs;
        extraSpecialArgs = {
          utils = import (self + "/utils");
        };
      };
      nvim = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule nixvimModule;
      config = inputs.nixvim.lib.evalNixvim {
        modules = [ (import (self + "/config")) ];
        extraSpecialArgs = {
          utils = import (self + "/utils");
        };
        inherit system;
      };
    in
    {
      packages = {
        default = nvim;
        initLua = pkgs.writeText "init.lua" config.config.content;
      };
    };
}
