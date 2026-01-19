{
  plugins = {
    rustaceanvim.enable = true;
    crates.enable = true;
    treesitter.settings.ensure_installed = [ "rust" ];
    conform-nvim.settings.formatters_by_ft.rust = [ "rustfmt" ];
  };
}
