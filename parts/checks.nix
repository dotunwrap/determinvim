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
    {
      checks = import (self + "/checks") { inherit inputs system; };
    };
}
