{ lib, pkgs, ... }:
let
  arduino-ls-wrapper = pkgs.writeShellScriptBin "arduino-ls-wrapper" ''
    # Find the project root by looking for arduino-cli.yaml
    find_config() {
      local dir="$PWD"
      while [ "$dir" != "/" ]; do
        if [ -f "$dir/arduino-cli.yaml" ]; then
          echo "$dir/arduino-cli.yaml"
          return 0
        fi
        dir="$(dirname "$dir")"
      done
      # If no config found, don't pass -cli-config flag
      return 1
    }

    # Extract FQBN from arduino-cli.yaml using yq or fallback to grep/awk
    extract_fqbn() {
      local config="$1"
      # Try to extract from sketch.default_fqbn or fqbn field
      if command -v ${lib.getExe pkgs.yq-go} &> /dev/null; then
        ${lib.getExe pkgs.yq-go} eval '.sketch.default_fqbn // .fqbn' "$config" 2>/dev/null | grep -v '^null$' || true
      else
        # Fallback to grep if yq is not available
        grep -E '^\s*(default_fqbn|fqbn):' "$config" | head -1 | sed 's/.*: *//' || true
      fi
    }

    CONFIG_PATH=$(find_config)

    if [ -n "$CONFIG_PATH" ]; then
      FQBN=$(extract_fqbn "$CONFIG_PATH")
      if [ -n "$FQBN" ]; then
        exec ${lib.getExe pkgs.arduino-language-server} \
          -cli ${lib.getExe pkgs.arduino-cli} \
          -clangd ${lib.getExe' pkgs.clang-tools "clangd"} \
          -cli-config "$CONFIG_PATH" \
          -fqbn "$FQBN" \
          "$@"
      else
        exec ${lib.getExe pkgs.arduino-language-server} \
          -cli ${lib.getExe pkgs.arduino-cli} \
          -clangd ${lib.getExe' pkgs.clang-tools "clangd"} \
          -cli-config "$CONFIG_PATH" \
          "$@"
      fi
    else
      exec ${lib.getExe pkgs.arduino-language-server} \
        -cli ${lib.getExe pkgs.arduino-cli} \
        -clangd ${lib.getExe' pkgs.clang-tools "clangd"} \
        "$@"
    fi
  '';
in
{
  lsp.servers.arduino_language_server = {
    enable = true;
    config = {
      cmd = [ (lib.getExe arduino-ls-wrapper) ];
      filetypes = [
        "cpp"
        "c"
        "ino"
      ];
      root_markers = [ "arduino-cli.yaml" ];
    };
  };
  plugins = {
    treesitter.settings.ensure_installed = [ "arduino" ];
    conform-nvim.settings.formatters_by_ft.cpp = [ "clang_format" ];
  };
}
