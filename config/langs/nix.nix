{ lib, pkgs, ... }:
{
  lsp.servers = {
    nil_ls.enable = true;
    statix.enable = true;
  };
  plugins = {
    treesitter.settings.ensure_installed = [ "nix" ];
    conform-nvim.settings = {
      formatters_by_ft.nix = [ "nixfmt" ];
      formatters.nixfmt.command = lib.getExe pkgs.nixfmt;
    };
  };
}
