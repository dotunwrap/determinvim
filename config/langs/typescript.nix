{
  plugins = {
    lsp.servers = {
      ts_ls.enable = true;
      eslint.enable = true;
    };
    treesitter.settings.ensure_installed = [
      "typescript"
      "javascript"
    ];
  };
}
