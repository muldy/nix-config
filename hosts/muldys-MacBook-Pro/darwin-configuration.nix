{ config, lib, pkgs, home-manager,... }:

{
  
  imports = [
    ../../darwin-cfg/dock.nix
    ../../darwin-cfg/spotlight.nix
  ];

  system.activationScripts.extraActivationPath = "/usr/bin";

  environment.systemPackages = with pkgs; [
    vim
    direnv
    ripgrep
  ];

  homebrew = {
    enable = true;
    global.autoUpdate = false;

    casks = [
      "discord"
      "syncthing"
      "visual-studio-code"
    ];

     #brewfile.enable = true;
  };


    nix.enable = false;

  users.users.muldy.home = "/Users/muldy";
  nix.settings.experimental-features = "nix-command flakes";
  programs.zsh.enable = true;  # default shell on catalina

  system.stateVersion = 5;



}
