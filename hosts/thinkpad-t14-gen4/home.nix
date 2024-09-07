{ config, pkgs, ... }:

{
  imports = 
  [
      ../../programs/git.nix
      #../../programs/gh.nix
      ../../programs/neovim.nix
      ../../programs/zsh.nix
      ../../programs/kitty.nix
      ../../programs/hyprland.nix
      ../../programs/eza.nix
      ../../programs/tmux.nix
      ../../programs/oh-my-posh.nix
      
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "muldy";
  home.homeDirectory = "/home/muldy";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    pkgs.arandr
    pkgs.coreutils-prefixed
    pkgs.fzf
    pkgs.gcc
    pkgs.gnumake
    #pkgs.git-doc
    #pkgs.git-extras
    pkgs.jq
    pkgs.k9s
    pkgs.kubectl
    pkgs.kubectx
    pkgs.kubernetes-helm
    pkgs.kustomize
    pkgs.pre-commit
    pkgs.ripgrep
    pkgs.tree
    pkgs.neofetch
    pkgs.tree-sitter
    pkgs.wget
    pkgs.wofi
    pkgs.yq
    pkgs.htop
    pkgs.waybar
    pkgs.pavucontrol
    pkgs.sway
    pkgs.nodejs_22
    pkgs.fh

  ];

  home.file = {
    ".config/ohmyposh/zen.toml".source = ../../dotfiles/oh-my-posh.toml;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/muldy/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
  #  EDITOR = "vim";
    DG_DATA_DIRS = "$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.bash.enable = true;
  #programs.starship.enable = true;
  #fonts.fontconfig.enable = true;



  
}
