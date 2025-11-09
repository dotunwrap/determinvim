{
  lib,
  utils,
  ...
}:
let
  inherit (utils.keymaps) mkKeymap;
  inherit (lib.nixvim) mkRaw;
in
{
  plugins.gitsigns = {
    enable = true;
  };
  keymaps = [
    (mkKeymap "n" "<leader>gb" (mkRaw ''
      function()
        require("gitsigns").blame_line()
      end
    '') "Git blame line")
    (mkKeymap "n" "<leader>gd" (mkRaw ''
      function()
        require("gitsigns").diffthis()
      end
    '') "Git diff")
  ];
}
