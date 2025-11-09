{
  inputs,
  system,
}:
let
  pkgs = inputs.nixpkgs.legacyPackages.${system};
  callPackage = pkgs.lib.callPackageWith (pkgs // { inherit (inputs) self; });
in
{
  nixfmt = callPackage ./nixfmt.nix { };
}
