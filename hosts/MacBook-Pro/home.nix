{ config, lib, pkgs, inputs, ... }:

{
  home.stateVersion = "23.11";
  imports = 
  [
      ../../pkg-config/git-work.nix
      ../../pkg-config/neovim.nix
      ../../pkg-config/kitty.nix
      ../../pkg-config/eza.nix
      ../../pkg-config/tmux.nix
      ../../pkg-config/oh-my-posh.nix
      ../../pkg-config/zsh.nix
#      ../../pkg-config/syncthing.nix
  ];
  home.packages = [
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    pkgs.awscli2
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
    pkgs.pinentry_mac
    pkgs.pre-commit
    pkgs.sops
    pkgs.tree
    pkgs.tree-sitter
    #pkgs.variety
    pkgs.wget
    pkgs.yq
    ];
  home.file = {
    ".config/ohmyposh/zen.toml".source = ../../dotfiles/oh-my-posh.toml;
    ".config/variety/variety.conf".source = ../../dotfiles/variety.conf;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.bash.enable = true;
}
