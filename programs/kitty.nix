{ config, pkgs, ...}:
{
	# kitty
  programs.kitty.enable = true;
  programs.kitty.font.name = "MyFont";
  programs.kitty.font.package = pkgs.fira-code;
  programs.kitty.font.size = 16;

  programs.kitty.extraConfig = ''
    remember_window_size  no
    initial_window_width  1750
    initial_window_height 1400
  '';
  
}