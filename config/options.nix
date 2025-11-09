{
  opts = {
    tabstop = 2;
    softtabstop = 2;
    showtabline = 2;
    expandtab = true;

    relativenumber = true;

    shiftwidth = 2;
    breakindent = true;

    mouse = "a";

    wrap = false;

    hlsearch = true;
    incsearch = true;

    splitbelow = true;
    splitright = true;

    ignorecase = true;
    smartcase = true;
    grepprg = "rg --vimgrep";
    grepformat = "%f:%l:%c:%m";

    swapfile = false;
    backup = false;
    undofile = true;

    termguicolors = true;

    signcolumn = "yes";

    cursorline = true;

    foldcolumn = "0";
    foldlevel = 99;
    foldlevelstart = 99;
    foldenable = true;
    foldmethod = "expr";
    foldexpr = "v:lua.vim.treesitter.foldexpr()";

    scrolloff = 8;

    encoding = "utf-8";
    fileencoding = "utf-8";
  };

  clipboard = {
    register = "unnamedplus";
    providers = {
      pbcopy.enable = true;
      wl-copy.enable = true;
      xsel.enable = true;
    };
  };
}
