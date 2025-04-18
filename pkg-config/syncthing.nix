
{ config, pkgs, ... }:

{
  services.syncthing = {
    enable = false;
    tray = {
      tray = true;
    }
  }

}
