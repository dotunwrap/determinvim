{ lib, pkgs, ... }:
let
  formatter = {
    __unkeyed-1 = "prettierd";
    __unkeyed-2 = "prettier";
    timeout_ms = 2000;
    stop_after_first = true;
  };
in
{
  plugins = {
    lsp.servers = {
      ts_ls.enable = true;
      eslint.enable = true;
    };
    treesitter.settings.ensure_installed = [
      "typescript"
      "javascript"
    ];
    conform-nvim.settings = {
      formatters_by_ft = {
        typescript = formatter;
        javascript = formatter;
      };
      formatters = {
        prettierd.command = lib.getExe pkgs.prettierd;
        prettier.command = lib.getExe pkgs.prettier;
      };
    };
  };
}
