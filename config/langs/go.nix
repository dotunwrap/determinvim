{
  lsp.servers.gopls.enable = true;
  plugins = {
    treesitter.settings.ensure_installed = [ "go" ];
    conform-nvim.settings.formatters_by_ft.go = [ "gofmt" ];
  };
}
