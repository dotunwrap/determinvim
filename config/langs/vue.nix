{
  plugins = {
    lsp.servers.vue_ls = {
      enable = true;
      tslsIntegration = true;
    };
    treesitter.settings.ensure_installed = [ "vue" ];
  };
}
