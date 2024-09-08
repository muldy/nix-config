
{ config, pkgs, ... }:

{
  programs.oh-my-posh.enable = true;
  programs.oh-my-posh.package= pkgs.oh-my-posh;
  programs.oh-my-posh.enableBashIntegration = true;
  programs.oh-my-posh.enableZshIntegration = true;

  #programs.oh-my-posh.useTheme = "catppuccin_mocha";


}