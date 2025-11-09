{
  plugins = {
    lsp.servers.postgres_lsp.enable = true;
    treesitter.settings.ensure_installed = [ "sql" ];
  };
}
