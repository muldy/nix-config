
{ config, pkgs, ...}:

{
  programs.wpaperd.enable = true;
  #programs.wpaperd.settings = ''
  #        [[DP-7]]
  #          path = "/home/muldy/Pictures/Wallpapers";
  #          apply-shadow = true;
  #        [[DP-8]]
  #          path = "/home/muldy/Pictures/Wallpapers";
  #          sorting = "descending";
  #    '';
}
