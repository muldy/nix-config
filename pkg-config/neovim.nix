{ config, pkgs, ...}:
{
	# neovim
	programs.neovim.enable = true;
	programs.neovim.viAlias = true;
	programs.neovim.vimAlias = true;
	programs.neovim.defaultEditor = true;

}
