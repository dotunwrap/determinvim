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
  plugins.aerial = {
    enable = true;
    settings = {
      default_direction = "prefer_left";
    };
  };
  keymaps = [
    (mkKeymap "n" "<leader>a" (mkRaw ''
      function()
        require("aerial").toggle({ focus = true, direction = "left" })
      end
    '') "Toggle Aerial")
  ];
}
