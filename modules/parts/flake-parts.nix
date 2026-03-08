{ inputs, lib, ... }:
{
  imports = [ inputs.flake-parts.flakeModules.modules ];

  flake.lib.parts = lib.pipe inputs.import-tree [
    (i: i.addPath ../parts)
    (i: i.addAPI {
      without = self: name:
        self.filterNot (lib.hasSuffix "${name}.nix");
    })
  ];

  debug = true;
}
