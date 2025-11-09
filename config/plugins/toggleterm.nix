{
  lib,
  utils,
  ...
}:
let
  inherit (lib.nixvim) mkRaw;
  inherit (utils.keymaps) mkKeymap;
in
{
  plugins.toggleterm = {
    enable = true;
    settings = {
      open_mapping = "[[<C-'>]]";
    };
  };
  keymaps = [
    (mkKeymap "n" "<C-'>" (mkRaw ''
      function()
        require("toggleterm").toggle()
      end
    '') "Toggle terminal")
  ];
}
