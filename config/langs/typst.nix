{ lib, pkgs, ... }:
{
  lsp.servers.tinymist.enable = true;
  plugins = {
    treesitter.settings.ensure_installed = [ "typst" ];
    conform-nvim.settings = {
      formatters_by_ft.typst = [ "typstyle" ];
      formatters.typstyle.command = lib.getExe pkgs.typstyle;
    };
  };
}
