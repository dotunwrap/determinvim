{ lib, ... }:
let
  inherit (lib.nixvim) mkRaw;
in
{
  autoCmd = [
    {
      desc = "Highlight on yank";
      event = [ "TextYankPost" ];
      callback = mkRaw ''
        function()
          vim.highlight.on_yank()
        end
      '';
    }
  ];
}
