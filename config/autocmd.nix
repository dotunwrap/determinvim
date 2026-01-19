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
    {
      desc = "Delete default LSP binds";
      event = [ "LspAttach" ];
      callback = mkRaw ''
        function(client, bufnr)
          pcall(vim.keymap.del, 'n', 'gra', { buffer = bufnr })
          pcall(vim.keymap.del, 'n', 'gri', { buffer = bufnr })
          pcall(vim.keymap.del, 'n', 'grn', { buffer = bufnr })
          pcall(vim.keymap.del, 'n', 'grt', { buffer = bufnr })
          pcall(vim.keymap.del, 'n', 'grr', { buffer = bufnr })
        end
      '';
    }
  ];
}
