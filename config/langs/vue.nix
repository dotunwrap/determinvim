{ lib, pkgs, ... }:
{
  plugins = {
    lsp.servers.vue_ls = {
      enable = true;
      tslsIntegration = true;
    };
    treesitter.settings.ensure_installed = [ "vue" ];
    conform-nvim.settings = {
      formatters_by_ft.vue = {
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
