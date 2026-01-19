{ utils, ... }:
let
  inherit (utils.keymaps) mkKeymap;
in
{
  keymaps = [
    (mkKeymap "v" "<Tab>" ">gv" "Indent selection right")
    (mkKeymap "v" "<S-Tab>" "<gv" "Indent selection left")
    # (mkKeymap "n" "<ESC>" "<CMD>noh<CR><ESC>" "Clear highlight")
  ];
}
