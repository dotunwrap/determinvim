{ lib, pkgs, ... }:
{
  lsp.servers.marksman.enable = true;
  plugins = {
    treesitter.settings.ensure_installed = [ "markdown" ];
    conform-nvim.settings = {
      formatters_by_ft.markdown = {
        __unkeyed-1 = "prettierd";
        __unkeyed-2 = "prettier";
        timeout_ms = 2000;
        stop_after_first = true;
      };
      formatters = {
        prettierd.command = lib.getExe pkgs.prettierd;
        prettier.command = lib.getExe pkgs.prettier;
      };
    };
  };
}
