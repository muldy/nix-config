
{ config, pkgs, ... }:

{
  programs.oh-my-posh.enable = true;
  programs.oh-my-posh.package= pkgs.oh-my-posh;
}
