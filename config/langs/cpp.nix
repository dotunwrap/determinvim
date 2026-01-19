{
  lsp.servers.clangd = {
    enable = true;
    config = {
      cmd = [
        "clangd"
        "--background-index"
      ];
      filetypes = [
        "c"
        "cpp"
      ];
    };
  };
  plugins = {
    treesitter.settings.ensure_installed = [
      "c"
      "cpp"
    ];
    conform-nvim.settings.formatters_by_ft.cpp = [ "clang_format" ];
  };
}
