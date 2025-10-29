{
  description = "macOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = { 
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-vscode-extensions }:
  let
    configuration = { pkgs, ... }: {
      users.users = {
        ren = {
          home = "/Users/ren";
        };
      };

      nixpkgs.config.allowUnfree = true;

      environment.systemPackages = [ 
       
      ];

      nixpkgs.overlays = [
        nix-vscode-extensions.overlays.default
      ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;
      system.primaryUser = "ren";

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      system.defaults = import ./defaults.nix;

      homebrew = {
        enable = true; 
        onActivation.cleanup = "uninstall"; 

        casks = [
          "ghostty"
          "raycast"
          "mac-mouse-fix"

          "notion"
          "notion-calendar"

          "telegram"
          "spotify"
          "beekeeper-studio"
          "pritunl"
          "slack"
          "zoom"
        ];
      };
    };
  in
  {
    darwinConfigurations."0x17" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration
        home-manager.darwinModules.home-manager {
          home-manager.users.ren = import ./home.nix; 
          home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
	  home-manager.verbose = true;
	  home-manager.backupFileExtension = "bac";
        }
      ];
    };
  };
}
