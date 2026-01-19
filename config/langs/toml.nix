{
  lsp.servers.tombi.enable = true;
  plugins = {
    treesitter.settings.ensure_installed = [ "toml" ];
    conform-nvim.settings.formatters_by_ft.toml = [ "tombi" ];
  };
}
