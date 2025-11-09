{
  imports = [
    ./globals.nix
    ./options.nix
    ./keymaps.nix
    ./autocmd.nix
    ./plugins
    ./langs
  ];

  luaLoader.enable = true;
  viAlias = true;
  vimAlias = true;
}
