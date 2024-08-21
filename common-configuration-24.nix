# NixOS Configuration common to both of my machines

{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.auto-cpufreq.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  environment.variables.EDITOR = "vim";	
  programs.zsh.enable = true;
  users.users.muldy = {
    isNormalUser = true;
    description = "Fox Muldy";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
    shell = pkgs.zsh;
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    auto-cpufreq
    curl
    dig
    firefox
    git
    git-doc
    gnomeExtensions.tray-icons-reloaded
    htop 
    home-manager
    kitty
    neovim
    discord
    python3
    python311Packages.virtualenv
    syncthing
    tailscale
    thunderbird
    tree
    unzip
    variety
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    vscode
    wget
    xsel
    zsh
  ];
  programs.tmux = {
    enable = true;
    clock24 = true;
    extraConfig = '' # used for less common options, intelligently combines if defined in multiple places.
    '';
  };
  fonts.fontconfig.enable = true;
  fonts.packages = with pkgs; [
    #(nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" "DroidSansMono" ]; })
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
  # Automatic Garbage Collection
  nix.gc = {
          automatic = true;
          dates = "weekly";
          options = "--delete-older-than 7d";
  };
  # Auto system update
  system.autoUpgrade = {
        enable = true;
  };
}
