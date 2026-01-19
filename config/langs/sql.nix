{
  lsp.servers.postgres_lsp.enable = true;
  plugins = {
    treesitter.settings.ensure_installed = [ "sql" ];
    conform-nvim.settings.formatters_by_ft.postgres = [ "pg_format" ];
  };
}
