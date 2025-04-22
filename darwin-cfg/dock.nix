{ config, pkgs, lib, ... }:

{
  system.defaults.dock = {
    autohide = true;
    orientation = "bottom"; # "left", "bottom", or "right"
    show-recents = false;
    tilesize = 16;
    magnification = true;
    largesize = 128;
    minimize-to-application = false;
    mru-spaces = false;
    static-only = false;
  };
}