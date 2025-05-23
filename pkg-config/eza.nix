
{ config, pkgs, ... }:

{
  programs.eza.enable = true;
  programs.eza.package= pkgs.eza;
  programs.eza.enableBashIntegration = true;
  programs.eza.enableZshIntegration = true;
  #programs.eza.icons = "auto";
  #programs.eza.colors = "auto";

  programs.eza.extraOptions = [
    "--group-directories-first"
    "--header"
  ];
}
