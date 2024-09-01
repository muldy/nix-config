{ stdenv, pkgs, fetchFromGithub }:

{
nvchad = stdenv.mkDerivation rec {
  pname = "nvchad";
  version = "";
  dontBuild = true;

  src = pkgs.fetchFromGitHub {
    owner = "NvChad";
    repo = "NvChad";
    rev = "c8777040fbda6a656f149877b796d120085cd918";
    #sha256 = ""
  };

  installPhase = ''
    # Fetch the whole repo and put it in $out
    mkdir $out
    cp -aR $src/* $out/
  '';
  };
}