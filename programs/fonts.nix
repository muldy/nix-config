{ config, pkgs, ... }:

{
  fonts = {
    fontconfig = {
      enable = true;
      localConf = ''
        <?xml version="1.0"?>
        <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
        <fontconfig>

          <!-- Not sure what this does -->
          <match target="scan">
            <test name="family">
              <string>Noto Color Emoji</string>
            </test>
            <edit name="scalable" mode="assign">
              <bool>true</bool>
            </edit>
          </match>

          <!-- Add icons as first font for any missing glyphs -->
          <match target="pattern">
            <edit name="family" mode="prepend_first">
              <string>Icons</string>
            </edit>
          </match>
            
          <!-- Want great emojies! -->
          <match target="pattern">
            <edit name="family" mode="prepend_first">
              <string>Noto Color Emoji</string>
            </edit>
          </match>

        <alias>
          <family>monospace</family>
            <prefer>
              <family>Ubuntu</family>
            </prefer>
        </alias>

        <alias>
          <family>serif</family>
            <prefer>
              <family>Ubuntu</family>
            </prefer>
        </alias>
        </fontconfig>
      '';
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [ "Ubuntu Mono" ];
        sansSerif = [ "FreeSans" ];
        serif = [ "FreeSerif" ];
      };
    };
    packages = with pkgs; [
      noto-fonts-emoji
      ubuntu_font_family
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];
  };
}