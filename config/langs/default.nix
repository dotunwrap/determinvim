{ lib, ... }:
{
  imports =
    with builtins;
    with lib;
    map (fn: ./${fn}) (
      filter (fn: (fn != "default.nix" && hasSuffix ".nix" "${fn}")) (attrNames (readDir ./.))
    );

  lsp = {
    inlayHints.enable = true;
    keymaps = [
      {
        key = "gD";
        lspBufAction = "declaration";
        options.desc = "[g]oto [D]eclaration";
      }
      {
        action = lib.nixvim.mkRaw "require('telescope.builtin').lsp_definitions";
        key = "gd";
        options.desc = "[g]oto [d]efinition";
      }
      {
        action = lib.nixvim.mkRaw "require('telescope.builtin').lsp_references";
        key = "gr";
        options.desc = "[g]oto [r]eferences";
      }
      {
        action = lib.nixvim.mkRaw "require('telescope.builtin').lsp_type_definitions";
        key = "gt";
        options.desc = "[g]oto [t]ype definition";
      }
      {
        action = lib.nixvim.mkRaw "require('telescope.builtin').lsp_implementations";
        key = "gi";
        options.desc = "[g]oto [i]mplementations";
      }
      {
        action = "<CMD>Lspsaga code_action<Enter>";
        key = "ga";
        options.desc = "[g]oto code [a]ctions";
      }
      {
        action = "<CMD>Lspsaga hover_doc<Enter>";
        key = "K";
        options.desc = "Open hover info";
      }
    ];
  };
}
