{ pkgs, ... }:
let
  # Base/main bindings
  mainBindings = {
    # Layout
    "alt-slash" = "layout tiles horizontal vertical";
    "alt-comma" = "layout accordion horizontal vertical";

    # Focus
    "alt-h" = "focus left";
    "alt-j" = "focus down";
    "alt-k" = "focus up";
    "alt-l" = "focus right";

    # Move
    "alt-shift-h" = "move left";
    "alt-shift-j" = "move down";
    "alt-shift-k" = "move up";
    "alt-shift-l" = "move right";

    # Resize
    "alt-shift-minus" = "resize smart -50";
    "alt-shift-equal" = "resize smart +50";

    # Workspaces (main)
    alt-1 = "workspace 1";
    "alt-2" = "workspace 2";
    "alt-3" = "workspace 3";
    "alt-4" = "workspace 4";
    "alt-5" = "workspace 5";
    "alt-6" = "workspace 6";
    "alt-7" = "workspace 7";
    "alt-8" = "workspace 8";
    "alt-9" = "workspace 9";
    "alt-i" = "workspace I";
    "alt-o" = "workspace O";
    "alt-q" = "workspace Q";
    "alt-f" = "workspace F";
    "alt-z" = "workspace Z";
    "alt-x" = "workspace X";
    "alt-c" = "workspace C";

    # Workspace navigation / monitor
    "alt-tab" = "workspace-back-and-forth";
    "alt-shift-tab" = "move-workspace-to-monitor --wrap-around next";

    # Modes
    "alt-shift-semicolon" = "mode service";
    "alt-a" = "mode work";
    "alt-s" = "mode study";
  };

  # Service mode bindings (no inheritance from main)
  serviceBindings = {
    esc = [ "reload-config" "mode main" ];
    r = [ "flatten-workspace-tree" "mode main" ];
    f = [ "layout floating tiling" "mode main" ];
    backspace = [ "close-all-windows-but-current" "mode main" ];

    "alt-shift-h" = [ "join-with left" "mode main" ];
    "alt-shift-j" = [ "join-with down" "mode main" ];
    "alt-shift-k" = [ "join-with up" "mode main" ];
    "alt-shift-l" = [ "join-with right" "mode main" ];
  };

  # Work/study overrides that replace overlapping main bindings
  workOverrides = {
    "alt-esc" = "mode main";
    "alt-1" = "workspace W1";
    "alt-2" = "workspace W2";
    "alt-3" = "workspace W3";
    "alt-4" = "workspace W4";
    "alt-5" = "workspace W5";
    "alt-6" = "workspace W6";
    "alt-7" = "workspace W7";
    "alt-8" = "workspace W8";
    "alt-9" = "workspace W9";

    "alt-shift-1" = "move-node-to-workspace W1";
    "alt-shift-2" = "move-node-to-workspace W2";
    "alt-shift-3" = "move-node-to-workspace W3";
    "alt-shift-4" = "move-node-to-workspace W4";
    "alt-shift-5" = "move-node-to-workspace W5";
    "alt-shift-6" = "move-node-to-workspace W6";
    "alt-shift-7" = "move-node-to-workspace W7";
    "alt-shift-8" = "move-node-to-workspace W8";
    "alt-shift-9" = "move-node-to-workspace W9";
  };

  studyOverrides = {
    "alt-esc" = "mode main";
    "alt-1" = "workspace S1";
    "alt-2" = "workspace S2";
    "alt-3" = "workspace S3";
    "alt-4" = "workspace S4";
    "alt-5" = "workspace S5";
    "alt-6" = "workspace S6";
    "alt-7" = "workspace S7";
    "alt-8" = "workspace S8";
    "alt-9" = "workspace S9";

    "alt-shift-1" = "move-node-to-workspace S1";
    "alt-shift-2" = "move-node-to-workspace S2";
    "alt-shift-3" = "move-node-to-workspace S3";
    "alt-shift-4" = "move-node-to-workspace S4";
    "alt-shift-5" = "move-node-to-workspace S5";
    "alt-shift-6" = "move-node-to-workspace S6";
    "alt-shift-7" = "move-node-to-workspace S7";
    "alt-shift-8" = "move-node-to-workspace S8";
    "alt-shift-9" = "move-node-to-workspace S9";
  };

  workBindings = mainBindings // workOverrides;
  studyBindings = mainBindings // studyOverrides;
in {
  enable = true;
  launchd.enable = true;

  userSettings = {
    start-at-login = false;

    on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];
    automatically-unhide-macos-hidden-apps = true;

    gaps = {
      inner = {
        horizontal = 10;
        vertical = 10;
      };
      outer = {
        left = 8;
        bottom = 8;
        top = 8;
        right = 8;
      };
    };

    mode = {
      main.binding = mainBindings;
      service.binding = serviceBindings;
      work.binding = workBindings;
      study.binding = studyBindings;
    };
  };
}


