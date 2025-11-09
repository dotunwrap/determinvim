{
  plugins = {
    lsp.servers.jsonls.enable = true;
    treesitter.settings.ensure_installed = [
      "json"
      "jsonc"
    ];
  };
}
