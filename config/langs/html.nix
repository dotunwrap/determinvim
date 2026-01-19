{ lib, pkgs, ... }:
{
  lsp.servers.html.enable = true;
  plugins = {
    treesitter.settings.ensure_installed = [ "html" ];
    conform-nvim.settings = {
      formatters_by_ft.html = {
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
