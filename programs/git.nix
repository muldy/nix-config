{ config, pkgs, ...}:
{
	# git 
	programs.git.enable = true;

	programs.git.delta.enable = true;
	programs.git.lfs.enable = true;
	programs.gitui.enable = true;

	programs.git.userEmail = "muldy@urmeta.eu";
	programs.git.userName = "muldy";

}
