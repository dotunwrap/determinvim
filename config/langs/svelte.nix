{ lib, pkgs, ... }:
{
  lsp.servers.svelte.enable = true;
  plugins = {
    treesitter.settings.ensure_installed = [ "svelte" ];
    conform-nvim.settings = {
      formatters_by_ft.svelte = {
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
