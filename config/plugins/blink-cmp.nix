{ lib, ... }:
let
  inherit (lib.nixvim) mkRaw;
in
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

      signature.enabled = true;

      completion = {
        trigger.show_on_insert_on_trigger_character = false;
        menu.draw.components = {
          kind_icon = {
            text = mkRaw ''
              function(ctx)
                local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                return kind_icon
              end
            '';
            highlight = mkRaw ''
              function(ctx)
                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                return hl
              end
            '';
          };
          kind = {
            highlight = mkRaw ''
              function(ctx)
                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                return hl
              end
            '';
          };
        };
      };
    };
  };
}
