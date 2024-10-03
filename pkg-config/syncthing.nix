
{ config, pkgs, ... }:

{
  services.syncthing = {
    enable = true;
    tray = {
      tray = true;
    }
  }

}