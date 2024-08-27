# NixOS Configuration common to both of my machines

{ config, pkgs, ... }:
{
  boot.loader.grub.theme = pkgs.stdenv.mkDerivation {
   pname = "distro-grub-themes";
   version = "3.1";
   src = pkgs.fetchFromGitHub {
     owner = "AdisonCavani";
     repo = "distro-grub-themes";
     rev = "v3.1";
     hash = "sha256-ZcoGbbOMDDwjLhsvs77C7G7vINQnprdfI37a9ccrmPs=";
   };
   installPhase = "cp -r customize/nixos $out";
  };
  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
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

    environment.gnome.excludePackages = with pkgs.gnome; [
    #baobab      # disk usage analyzer
    #cheese      # photo booth
    eog         # image viewer
    #epiphany    # web browser
    gedit       # text editor
    #simple-scan # document scanner
    totem       # video player
    #yelp        # help viewer
    evince      # document viewer
    file-roller # archive manager
    #geary       # email client
    #seahorse    # password manager

    # these should be self explanatory
    #gnome-calculator gnome-calendar gnome-characters gnome-clocks gnome-contacts
    #gnome-font-viewer gnome-logs gnome-maps gnome-music gnome-photos gnome-screenshot
    #gnome-system-monitor gnome-weather gnome-disk-utility pkgs.gnome-connections
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  environment.variables.EDITOR = "vim";	
  programs.fish.enable = true;
  users.users.muldy = {
    isNormalUser = true;
    description = "Fox Muldy";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      barrier
      tilix
      variety
      syncthing
      k9s
    ];
    shell = pkgs.fish;
  };


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    tmux
    unzip
    htop
    wget
    curl
    tree
    fish
    git
    delta
    tailscale
    pkgs.discord
    python3
    python311Packages.virtualenv
    dig
    firefox
    thunderbird
    beeper
    gnomeExtensions.tray-icons-reloaded
  ];
  programs.tmux = {
    enable = true;
    clock24 = true;
    extraConfig = '' # used for less common options, intelligently combines if defined in multiple places.
    '';
  };
  fonts.fonts = with pkgs; [
    font-awesome
    powerline-fonts
    powerline-symbols
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

