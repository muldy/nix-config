{ config, lib, pkgs, inputs, ... }:

{
  home.stateVersion = "23.11";
  imports = 
  [
      ../../pkg-config/git.nix
      ../../pkg-config/neovim.nix
      ../../pkg-config/kitty.nix
      ../../pkg-config/eza.nix
      ../../pkg-config/tmux.nix
      ../../pkg-config/oh-my-posh.nix
      ../../pkg-config/zsh.nix
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
