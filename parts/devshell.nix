_: {
  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = builtins.attrValues {
          inherit (pkgs) just nil nixfmt;
        };
      };

      formatter = pkgs.nixfmt-tree;
    };
}
