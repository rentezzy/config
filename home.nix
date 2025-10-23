{  config, pkgs, lib, ... }: {
  home.username = "ren";

  home.stateVersion = "25.05";

  home.sessionVariables = {
    EDITOR = "vim";
  };

  home.shell.enableZshIntegration = true;
  home.packages = with pkgs; [
    gnupg
    gh
    pnpm
    code-cursor
  ];

  programs.home-manager.enable = true;
  programs.zsh = {
    enable = true;

    shellAliases = {  
      tt = "if [ -z \"$TMUX\" ]; then tmux attach \; choose=tree -sw; else tmux choose-tree -sw; fi";
      switch = "sudo darwin-rebuild switch --flake ~/config && source ~/.zshrc && clear";
 
    };
    
    "oh-my-zsh" = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };
  
  programs.git = {
    enable = true;

    userName = "Nikita Dzhezhela";
    userEmail = "dzhezhela.nikita@gmail.com";

    ignores = [ ".DS_Store" ];

    extraConfig = {
      push.autoSetupRemote = true;
      user.signingKey = "3DB619E96CE5C4DC";
      commit.gpgSign = true;
    };
  };
  
  programs.chromium = {
    enable = true;
    package = pkgs.google-chrome;
  };

  programs.ghostty = {
    enable = true;
    package = null;

    enableZshIntegration = true;

    settings = {
      theme = "Raycast Dark";
      selection-foreground = "#FDFDFD";
      selection-background = "#F57FFF";
      background-opacity = 0.9;
      background-blur = 14;
      window-padding-y = 0;
      window-padding-balance = false;
      font-feature = "-liga,-calt";

      cursor-style = "block";
      cursor-style-blink = true;
    };
  };

  programs.tmux = {
    enable = true;

    clock24 = true;
    keyMode = "vi";
    mouse = true;
  };
  
  programs.btop = {
    enable = true;
  };

  programs.mise = {
    enable = true;

    globalConfig = {
      tools = {
        node = "lts";
        python = "latest";
      };
    };
  };

  programs.bun = {
    enable = true;
  };

  programs.aerospace = import ./aerospace/aerospace.nix { pkgs = pkgs; };

  imports = [ ./code/cursor.nix ];
}
