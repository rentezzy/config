{  config, pkgs, ... }: {
  home.username = "ren";

  home.stateVersion = "25.05";

  home.sessionVariables = {
    EDITOR = "vim";
  };

  home.packages = with pkgs; [
    gnupg
  ];

  programs.home-manager.enable = true;
  programs.zsh = {
    enable = true;

    shellAliases = {  
      tt = "if [ -z \"$TMUX\" ]; then tmux attack \; choose=tree -sw; else tmux choose-tree -sw; fi";
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
}
