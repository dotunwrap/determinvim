{
  plugins.lsp = {
    enable = true;
    inlayHints = true;
    keymaps = {
      lspBuf = {
        K = "hover";
        gr = "references";
        gD = "declaration";
        gd = "definition";
        gi = "implementation";
        gt = "type_definition";
      };
      extra = [
        {
          action = {
            __raw = "require('telescope.builtin').lsp_definitions";
          };
          key = "gd";
        }
        {
          action = "<CMD>Lspsaga hover_doc<Enter>";
          key = "K";
        }
      ];
    };
  };
}
