{ pkgs, ... }:
let
  extensions = (import ./extensions.nix) { inherit pkgs; };
  keybindings = import ./keybindings.nix;
  settings = import ./settings.nix;
in
{
  enable = true;

  package = pkgs.code-cursor;

  profiles.default = {
    keybindings = keybindings;
    userSettings = settings;
    extensions = extensions;
  };
}
