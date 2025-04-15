{ config, pkgs, ...}:
{
	# git 
	programs.git.enable = true;
	programs.git.package = pkgs.gitFull;

	programs.git.delta.enable = true;
	programs.git.lfs.enable = true;
  programs.gh.gitCredentialHelper.enable = true;
  programs.git.extraConfig.credential.helper = "!gh auth git-credential";
  programs.gh.gitCredentialHelper.hosts = [
    "https://github.com"
    "https://gist.github.com"
    "https://gitea.app.urmeta.eu"
  ];
	#programs.gitui.enable = true;

#  programs.git.diff-so-fancy.enable = true;
	
  #programs.git.userEmail = "muldy@urmeta.eu";
	#programs.git.userName = "muldy";


	programs.git.extraConfig = {
    push.autoSetupRemote = true;
    delta.features = "decorations";
    delta.side-by-side = true;

      delta.interactive.keep-plus-minus-markers = false;

      "delta.decorations".commit-decoration-style = "blue ol";
      "delta.decorations".commit-style = "raw";
      "delta.decorations".file-style = "omit";
      "delta.decorations".hunk-header-decoration-style = "blue box";
      "delta.decorations".hunk-header-file-style = "red";
      "delta.decorations".hunk-header-line-number-style = "#067a00";
      "delta.decorations".hunk-header-style = "file line-number syntax";

  };
}
