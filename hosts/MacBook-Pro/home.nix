{ config, lib, pkgs, inputs, ... }:

{
  home.stateVersion = "23.11";
  imports = 
  [
      ../../pkg-config/git.nix
  ]
}
