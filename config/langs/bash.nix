{ lib, pkgs, ... }:
{
  lsp.servers.bashls.enable = true;

  plugins = {
    treesitter.settings.ensure_installed = [ "bash" ];
    conform-nvim.settings = {
      formatters_by_ft.bash = [
        "shellcheck"
        "shellharden"
        "shfmt"
      ];
      formatters = {
        shellcheck.command = lib.getExe pkgs.shellcheck;
        shellharden.command = lib.getExe pkgs.shellharden;
        shfmt.command = lib.getExe pkgs.shfmt;
      };
    };
  };
}
