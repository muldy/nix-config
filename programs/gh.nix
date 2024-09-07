{ config, pkgs, ...}:
{
	#.gh.
	programs.gh.enable = true;
	programs.gh.package = pkgs.gh;


}
