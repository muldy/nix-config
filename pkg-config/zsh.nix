{ config, pkgs, environment,  ...}:
{
	programs.zsh.enable = true;
	programs.zsh.package = pkgs.zsh;
	programs.zsh.enableVteIntegration = true;
	#programs.zsh.dotDir = ".config/zsh";
	
	programs.zsh.enableCompletion = true;
	programs.zsh.autosuggestion.enable = true;

	programs.zsh.syntaxHighlighting.enable = true;

	programs.zsh.historySubstringSearch.enable = true;
	programs.zsh.historySubstringSearch.searchDownKey = "$terminfo[kcud1]";
	programs.zsh.historySubstringSearch.searchUpKey = "$terminfo[kcuu1]";
	programs.zsh.history.ignoreAllDups = true;


	programs.zsh.oh-my-zsh.enable = true;
	programs.zsh.oh-my-zsh.theme = "agnoster";
	programs.zsh.oh-my-zsh.plugins = 
		[
			"git"
			"sudo"
		];
	 programs.zsh.plugins = 
	 [
	 
	 	{
	 		# will You Should Use
	 		name = "zsh-you-should-use";
	 		src = pkgs.fetchFromGitHub {
	 			owner = "MichaelAquilina";
	 			repo = "zsh-you-should-use";
	 			rev = "f13d39a1ae84219e4ee14e77d31bb774c91f2fe3";
			sha256 = "+3iAmWXSsc4OhFZqAMTwOL7AAHBp5ZtGGtvqCnEOYc0=";
	 		};
	 	}
	 ];
	# programs.zsh.envExtra = ''
	# '';


	programs.zsh.shellAliases = {
	pbcopy = "gpaste-client";
	pbpaste = "echo `gpaste-cient get --use-index 0 --reverse `";
	aws-profile = "export AWS_PROFILE=$(sed -n \"s/\[profile \(.*\)\]/\1/gp\" ~/.aws/config | fzf)";
		
	};
}
