{ config, pkgs, ... }:

{
  fonts = {
    fontconfig = {
      enable = true;
      localConf = ''
      <?xml version="1.0"?>
      <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
      <fontconfig>
        <match target="font">
          <edit name="autohint" mode="assign">
            <bool>true</bool>
          </edit>
        </match>
        <alias>
          <family>MyFont</family>
          <prefer>
            <family>Ubuntu</family>
            <family>Symbols Nerd Font</family>
            <family>Noto Color Emoji</family>
          </prefer>
        </alias>
      </fontconfig>
      '';
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [ "Ubuntu" ];
        sansSerif = [ "FreeSans" ];
        serif = [ "FreeSerif" ];
      };
    };
    packages = with pkgs; [
      noto-fonts-emoji
      ubuntu_font_family
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" "Ubuntu" "UbuntuMono" "FiraCode" "FiraMono" ]; })
      pkgs.powerline-fonts
    ];
  };
}