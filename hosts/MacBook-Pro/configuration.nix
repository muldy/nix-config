{ config, lib, pkgs, home-manager,... }:
{

  environment.systemPackages = with pkgs; [
    vim
    direnv
    ripgrep
  ];

  fonts.packages = [
           pkgs.nerd-fonts.droid-sans-mono
           pkgs.nerd-fonts.fira-code
         ];

  homebrew = {
    enable = true;
    global.autoUpdate = false;

    casks = [ 
      "discord"
      "syncthing"
    ];
  };

  users.users.muldy.home = "/Users/muldy";
  nix.settings.experimental-features = "nix-command flakes";
  programs.zsh.enable = true;  # default shell on catalina
  
  system.stateVersion = 5;


  nixpkgs.hostPlatform = "aarch64-darwin";

}
