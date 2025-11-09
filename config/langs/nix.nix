{
  plugins = {
    lsp.servers = {
      nil_ls = {
        enable = true;
      };
      statix.enable = true;
    };
    treesitter.settings.ensure_installed = [ "nix" ];
  };
}
