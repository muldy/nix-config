{ config, pkgs, ...}:
{
	# git 
	programs.git.enable = true;
	programs.git.package = pkgs.git;

	programs.git.delta.enable = true;
	programs.git.delta.package = pkgs.delta;
	programs.git.lfs.enable = true;
	programs.gitui.enable = true;

	programs.git.userEmail = "muldy@urmeta.eu";
	programs.git.userName = "muldy";


	programs.git.extraConfig = ''
	[core]
	    pager = delta

	[interactive]
	    diffFilter = delta --color-only --features=interactive

	[delta]
	    features = decorations

	[delta "interactive"]
	    keep-plus-minus-markers = false

	[delta "decorations"]
	    commit-decoration-style = blue ol
	    commit-style = raw
	    file-style = omit
	    hunk-header-decoration-style = blue box
	    hunk-header-file-style = red
	    hunk-header-line-number-style = "#067a00"
	    hunk-header-style = file line-number syntax
	'';

}
