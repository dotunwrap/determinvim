{
  plugins.blink-cmp = {
    enable = true;
    settings = {
      keymap = {
        preset = "default";
        "<Enter>" = [
          "select_and_accept"
          "fallback"
        ];
      };

      completion.trigger.show_on_insert_on_trigger_character = false;
    };
  };
}
