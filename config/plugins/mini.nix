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
  plugins = {
    mini-ai.enable = true;
    mini-basics.enable = true;
    mini-bufremove.enable = true;
    mini-comment = {
      enable = true;
      settings = {
        options = {
          custom_commentstring = mkRaw ''
            function()
              return require("ts_context_commentstring.internal").calculate_commentstring()
                or vim.bo.commentstring
            end
          '';
        };
      };
    };
    mini-icons = {
      enable = true;
      mockDevIcons = true;
    };
    mini-jump2d.enable = true;
    mini-notify.enable = true;
    mini-pairs.enable = true;
    mini-splitjoin.enable = true;
    mini-starter = {
      enable = true;
      settings = {
        header = ''
               __    __                _          _
           ___/ /__ / /____ ______ _  (_)__ _  __(_)_ _
          / _  / -_) __/ -_) __/  ' \/ / _ \ |/ / /  ' \
          \_,_/\__/\__/\__/_/ /_/_/_/_/_//_/___/_/_/_/_/
        '';
      };
    };
    mini-statusline.enable = true;
    mini-surround.enable = true;
    mini-tabline.enable = true;
  };
  keymaps = [
    (mkKeymap "n" "<leader>bc" (mkRaw ''
      function()
        require("mini.bufremove").delete()
      end
    '') "Close current buffer")
  ];
}
