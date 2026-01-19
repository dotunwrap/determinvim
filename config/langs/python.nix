{
  lsp.servers = {
    ruff.enable = true;
    pyright = {
      enable = true;
      config = {
        pyright.disableOrganizeImports = true;
        python.analysis.ignore = [ "*" ];
      };
    };
  };
  plugins = {
    treesitter.settings.ensure_installed = [ "python" ];
    conform-nvim.settings.formatters_by_ft.python = [
      "ruff_fix"
      "ruff_format"
      "ruff_organize_imports"
    ];
  };
}
