{ config, pkgs, lib, inputs, ... }:

{

  imports = 
  [
      ../../pkg-config/git.nix
      ../../pkg-config/gh.nix
      ../../pkg-config/neovim.nix
      ../../pkg-config/eza.nix
      ../../pkg-config/tmux.nix

      ../../pkg-config/zsh.nix
      
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
  home.enableNixpkgsReleaseCheck = false;
  home.packages = [
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    pkgs.age
    pkgs.argocd
    pkgs.bat
    #pkgs.bitwarden-cli
    pkgs.dig
    pkgs.coreutils-prefixed
    pkgs.file
    pkgs.fh
    pkgs.fzf
    pkgs.gcc
    pkgs.git-doc
    pkgs.git-extras
    pkgs.git-credential-manager
    pkgs.gnumake
    pkgs.gnupg
    pkgs.htop
    pkgs.jq
    pkgs.k9s
    pkgs.krew
    pkgs.kubectl
    pkgs.kubectl-cnpg
    pkgs.kubectx
    pkgs.kubernetes-helm
    pkgs.kustomize
    pkgs.kustomize-sops
    pkgs.neofetch
    pkgs.nettools
    pkgs.nodejs_22
    pkgs.openssl
    pkgs.opentofu
    pkgs.pre-commit
    pkgs.pinentry-tty
    pkgs.ripgrep
    pkgs.tftp-hpa
    pkgs.sops
    pkgs.tree
    pkgs.tree-sitter
    pkgs.virtualenv
    pkgs.unrar-free
    pkgs.wakelan
    pkgs.wget
    pkgs.yq
    pkgs.zsh-powerlevel10k

  ];

  home.file = {
    #".config/ohmyposh/zen.toml".source = ../../dotfiles/oh-my-posh.toml;
    ".gitconfig".source = ../../dotfiles/gitconfig;
    ".p10k.zsh".source = ../../dotfiles/p10k.zsh;

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
    #EDITOR = "vim";
    #DG_DATA_DIRS = "$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share";
    YSU_HARDCORE = 1;
    GCM_CREDENTIAL_STORE = "secretservice";
    TERM = "xterm-256color";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.bash.enable = true;
  #programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  #programs.starship.enable = true;
  #fonts.fontconfig.enable = true;
}
