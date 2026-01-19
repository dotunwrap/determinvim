{
  plugins = {
    lsp.servers.clangd = {
      enable = true;
      cmd = [
        "clangd"
        "--background-index"
      ];
      filetypes = [
        "c"
        "cpp"
      ];
    };
    treesitter.settings.ensure_installed = [ "c" "cpp" ];
  };
}
