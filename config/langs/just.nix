{ lib, pkgs, ... }:
{
  lsp.servers.just.enable = true;
  plugins = {
    treesitter.settings.ensure_installed = [ "just" ];
    conform-nvim.settings = {
      formatters_by_ft.just = [ "just" ];
      formatters.just = {
        command = lib.getExe pkgs.just;
        args = [
          "--fmt"
          "--stdin"
        ];
        stdin = true;
      };
    };
  };
}
