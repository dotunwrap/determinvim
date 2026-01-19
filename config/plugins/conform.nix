{
  lib,
  pkgs,
  autoInstallFormatters,
  ...
}:
{
  plugins.conform-nvim = {
    enable = true;
    autoInstall.enable = autoInstallFormatters;
    settings = {
      formatters_by_ft = {
        "_" = [
          "squeeze_blanks"
          "trim_whitespace"
          "trim_newlines"
        ];
      };
      formatters.squeeze_blanks.command = lib.getExe' pkgs.coreutils "cat";
      format_on_save = {
        timeout_ms = 500;
        lsp_format = "fallback";
      };
    };
  };
}
