{ lib, pkgs, ... }:
{
  lsp.servers.lua_ls.enable = true;
  plugins = {
    treesitter.settings.ensure_installed = [ "lua" ];
    conform-nvim.settings = {
      formatters_by_ft.lua = [ "stylua" ];
      formatters.stylua.command = lib.getExe pkgs.stylua;
    };
  };
}
