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
  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native.enable = true;
      ui-select.enable = true;
    };
  };
  keymaps = [
    (mkKeymap "n" "<leader>ff" (mkRaw ''
      function()
        require("telescope.builtin").find_files()
      end
    '') "Find files")
    (mkKeymap "n" "<leader>fg" (mkRaw ''
      function()
        require("telescope.builtin").live_grep()
      end
    '') "Live grep")
    (mkKeymap "n" "<leader>fb" (mkRaw ''
      function()
        require("telescope.builtin").buffers()
      end
    '') "Find buffers")
    (mkKeymap "n" "<leader>fs" (mkRaw ''
      function()
        require("telescope.builtin").treesitter()
      end
    '') "Find treesitter objects")
  ];
}
