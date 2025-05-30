# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      inputs.home-manager.nixosModules.default
    ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;


  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Lisbon";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_PT.UTF-8";
    LC_IDENTIFICATION = "pt_PT.UTF-8";
    LC_MEASUREMENT = "pt_PT.UTF-8";
    LC_MONETARY = "pt_PT.UTF-8";
    LC_NAME = "pt_PT.UTF-8";
    LC_NUMERIC = "pt_PT.UTF-8";
    LC_PAPER = "pt_PT.UTF-8";
    LC_TELEPHONE = "pt_PT.UTF-8";
    LC_TIME = "pt_PT.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "pt";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "pt-latin1";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  #fingerprint
  services.fprintd.enable = true;
  services.fprintd.tod.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;

  # flatpaks
  services.flatpak.enable = true;

  # Enable sound with pipewire.
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

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  programs.zsh.enable = true;
  users.users.muldy = {
    isNormalUser = true;
    description = "muldy";
    extraGroups = [ "networkmanager" "wheel" "input" "docker"];
    shell = pkgs.zsh;
    packages = with pkgs; [

    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = {inherit inputs;};
    users = {
      "muldy" = import ./home.nix;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #(nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" "Ubuntu" "Ubuntu" "FiraCode" "FiraMono" ]; })
    #nerd-fonts.NerdFontsSymbolsOnly
    #nerd-fonts.Ubuntu
    #nerd-fonts.FiraCode
    #nerd-fonts.FiraMono
    arandr
    auto-cpufreq
    direnv
    #(pkgs.discord.override {
    #  # remove any overrides that you don't want
    #  withOpenASAR = true;
    #  withVencord = true;
    #})
    discord-canary
    fprintd
    gnome-software
    gnomeExtensions.battery-health-charging
    gnomeExtensions.caffeine
    gnomeExtensions.custom-hot-corners-extended
    gnomeExtensions.tailscale-status
    #gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.wallpaper-slideshow
    go
    pinentry-gnome3
    keybase
    keybase-gui
    kitty
    lm_sensors
    nix-index
    nfs-utils
    openrgb-with-all-plugins
    openttd
    obs-studio
    pavucontrol
    pciutils
    python3
    sway
    thunderbird
    unzip
    vim
    vscode
    waybar
    wofi
    xclip
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  services.tailscale.enable = true;
  services.power-profiles-daemon.enable = false;
  services.auto-cpufreq.enable = true;

  services.auto-cpufreq.settings = {
      charger = {
        governor = "performance"; # string
        energy_performance_preference = "performance"; # string
        # platform_profile = "performance"; # Uncomment if needed
        # scaling_min_freq = 800000; # Uncomment if needed (int in kHz)
        # scaling_max_freq = 1000000; # Uncomment if needed (int in kHz)
        turbo = "auto"; # string

        # Uncomment to add ignored power supplies
        # power_supply_ignore_list = {
        #   name1 = "this";
        #   name2 = "is";
        #   name3 = "an";
        #   name4 = "example";
        # };
      };

      battery = {
        governor = "powersave"; # string
        energy_performance_preference = "power"; # string
        # platform_profile = "low-power"; # Uncomment if needed
        # scaling_min_freq = 800000; # Uncomment if needed (int in kHz)
        # scaling_max_freq = 1000000; # Uncomment if needed (int in kHz)
        turbo = "auto"; # string

        # Uncomment for experimental battery threshold settings
        # enable_thresholds = true; # boolean
        # start_threshold = 0; # int
        # stop_threshold = 100; # int

        enable_thresholds = true;
        start_threshold = 25;
        stop_threshold = 90;
        ideapad_laptop_conservation_mode=true;
      };
  };

  services.keybase.enable = true;
  services.kbfs.enable = true;



  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  environment.pathsToLink = [ "/share/zsh" ];
  fonts.fontDir.enable = true;


  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
	  enable = true;
	  setSocketVariable = true;
	};

}
