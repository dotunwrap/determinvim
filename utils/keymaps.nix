{
  keymaps = rec {
    mkKeymap = mode: key: action: desc: {
      inherit mode key action;
      options = {
        inherit desc;
        silent = true;
        noremap = true;
      };
    };

    mkKeymap' =
      mode: key: action:
      mkKeymap mode key action null;

    wKeyObj =
      list:
      let
        optionalAttrs = cond: attrs: if cond then attrs else { };
      in
      {
        __unkeyed = builtins.elemAt list 0;
        icon = builtins.elemAt list 1;
        group = builtins.elemAt list 2;
      }
      // optionalAttrs (builtins.length list > 3) {
        hidden = builtins.elemAt list 3;
      };
  };
}
