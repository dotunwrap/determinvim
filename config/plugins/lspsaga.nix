{
  plugins.lspsaga = {
    enable = true;
    settings = {
      lightbulb = {
        virtual_text = false;
      };
      hover = {
        open_link = "<C-CR>";
      };
      diagnostic = {
        diagnostic_only_current = true;
      };
    };
  };
}
