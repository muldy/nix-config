
{ config, pkgs, ... }:

{
  programs.oh-my-posh.enable = true;
  programs.oh-my-posh.package= pkgs.oh-my-posh;
  programs.oh-my-posh.enableBashIntegration = true;
  programs.oh-my-posh.enableZshIntegration = true;

  #programs.oh-my-posh.useTheme = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile "${pkgs.oh-my-posh}/share/oh-my-posh/themes/catppuccin_mocha.omp.json"));

  #programs.oh-my-posh.settings =  "~/.config/ohmyposh/zen."; #builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile "oh-my-posh.json"));
  #programs.oh-my-posh.settings = "poop";


}