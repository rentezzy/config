{  config, pkgs, ... }: {
  home.username = "ren";

  home.stateVersion = "25.05";

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.home-manager.enable = true;
  
  programs.git = {
    enable = true;

    userName = "Nikita Dzhezhela";
    userEmail = "dzhezhela.nikita@gmail.com";

    ignores = [ ".DS_Store" ];

    extraConfig = {
      push.autoSetupRemote = true;
    };
  };
}
