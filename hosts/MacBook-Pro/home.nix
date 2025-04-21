{ config, lib, pkgs, inputs, ... }:

{
  home.stateVersion = "23.11";
  imports = 
  [
      ../../pkg-config/git-work.nix
      ../../pkg-config/gh.nix
      ../../pkg-config/neovim.nix
      ../../pkg-config/kitty.nix
      ../../pkg-config/eza.nix
      ../../pkg-config/tmux.nix
      ../../pkg-config/zsh.nix
  ];
  home.packages = [
    pkgs.awscli2
    pkgs.ansible-lint
    pkgs.bat
    pkgs.coreutils-prefixed
    pkgs.dos2unix
    pkgs.fh
    pkgs.fzf
    pkgs.gcc
    pkgs.git-doc
    pkgs.git-extras
    pkgs.gnumake
    pkgs.gnupg
    pkgs.htop
    pkgs.jq
    pkgs.k9s
    pkgs.kubectl
    pkgs.kubectx
    pkgs.kubernetes-helm
    pkgs.kustomize
    pkgs.neofetch
    pkgs.nodejs_22
    pkgs.opentofu
    pkgs.pinentry_mac
    pkgs.pre-commit
    pkgs.python311 # poetry
    pkgs.sops
    pkgs.tree
    pkgs.tree-sitter
    pkgs.virtualenv
    pkgs.wget
    pkgs.yq
    pkgs.zstd
    pkgs.zsh-powerlevel10k
    ];
 
  
  home.file = {
    ".config/kitty/tab_bar.py".source = ../../dotfiles/tab_bar.py;
    ".p10k.zsh".source = ../../dotfiles/p10k.zsh;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
  home.sessionVariables = {
    #EDITOR = "vim";
    TERM = "xterm-256color";
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.bash.enable = true;
  programs.neovim.defaultEditor = true;
}
