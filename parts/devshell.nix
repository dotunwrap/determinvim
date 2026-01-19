_: {
  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = builtins.attrValues {
          inherit (pkgs) nil nixfmt;
        };
      };

      formatter = pkgs.nixfmt-tree;
    };
}
