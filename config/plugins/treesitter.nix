{
  plugins = {
    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
        folding = true;
        incremental_selection.enable = true;
        auto_install = false;
      };
    };
    treesitter-context = {
      enable = true;
      settings = {
        max_lines = 4;
        min_window_height = 40;
      };
    };
    treesitter-textobjects = {
      enable = true;
    };
    ts-context-commentstring = {
      enable = true;
    };
  };
}
