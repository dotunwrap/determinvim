{ lib, pkgs, ... }:
{
  lsp.servers.terraformls.enable = true;
  plugins = {
    treesitter.settings.ensure_installed = [ "terraform" ];
    conform-nvim.settings = {
      formatters_by_ft.terraform = [ "terraform_fmt" ];
      formatters.terraform_fmt.command = lib.getExe pkgs.terraform;
    };
  };
}
