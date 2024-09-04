
{ config, pkgs, ... }:

{
  programs.eza.enable = true;
  programs.eza.enableBashIntegration = true;
  programs.eza.enableZshIntegration = true;
  programs.eza.icons = true;
}