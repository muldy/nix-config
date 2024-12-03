{ config, lib, pkgs, home-nanager,... }:
{

  environment.systemPackages = with pkgs; [
    vim
    direnv
    ripgrep
    #(nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" "Ubuntu" "UbuntuMono" "FiraCode" "FiraMono" ]; })

  ];

  homebrew = {
    enable = true;
    global.autoUpdate = false;

    casks = [ 
      "kitty" 
      "discord"
      "syncthing"
    ];
  };

  users.users.muldy.home = "/Users/muldy";
  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;
  
  # Set Git commit hash for darwin-version.
  #system.configurationRevision = self.rev or self.dirtyRev or null;
  
  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  nix.configureBuildUsers = true;
  
  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

#  programs.zsh.initExtra = ''
#		eval "$(/opt/homebrew/bin/brew shellenv)"
#	'';

}


