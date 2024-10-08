{ config, pkgs, ...}:


{
  programs.git = {
    enable = true;  # Keep this if you want git enabled
	package = pkgs.gitFull;
	delta.enable = true;
	lfs.enable = true;
	#gitui.enable = true;

  };
}

# {
# 	# git 
# 	programs.git.enable = true;
# 	programs.git.package = pkgs.gitFull;

# 	programs.git.delta.enable = true;
# 	programs.git.lfs.enable = true;
# 	programs.gitui.enable = true;

# #  programs.git.diff-so-fancy.enable = true;
	
#   programs.git.userEmail = "extern.fernandes-miguel@allianz.de";
# 	programs.git.userName = "Miguel Fernandes";

# 	  programs.git.http = {
#       proxy = "http://proxy-url:port";
#       https = "http://proxy-url:port";
#     };


# # 	programs.git.extraConfig = ''
# # 	[core]
# # 	    pager = delta

# # 	[interactive]
# # 	    diffFilter = delta --color-only --features=interactive

# # 	[delta]
# # 	    features = decorations
# #       side-by-side = true

# # 	[delta "interactive"]
# # 	    keep-plus-minus-markers = false

# # 	[delta "decorations"]
# # 	    commit-decoration-style = blue ol
# # 	    commit-style = raw
# # 	    file-style = omit
# # 	    hunk-header-decoration-style = blue box
# # 	    hunk-header-file-style = red
# # 	    hunk-header-line-number-style = "#067a00"
# # 	    hunk-header-style = file line-number syntax
# #   [http]
# #   		http://127.0.0.1:9000/localproxy-e3b0c442.pac
# # 	'';

# }
