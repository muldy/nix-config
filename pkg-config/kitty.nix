{ config, pkgs, ...}:
{
	# kitty
  programs.kitty.enable = true;
  programs.kitty.font.name = "FiraCode Nerd Font Mono";
  #programs.kitty.font.name = "Fantasque Sans Mono";
  #programs.kitty.font.name = "Ubuntu";
  #programs.kitty.font.package = nerd-fonts.FiraCode;
  programs.kitty.font.size = 17;

  programs.kitty.extraConfig = ''
    shell zsh
    remember_window_size  no
    initial_window_width  1280
    initial_window_height 720

    ## Tab bar
    tab_bar_edge bottom
    tab_bar_align left
    tab_bar_style custom
    tab_bar_min_tabs 1
    tab_activity_symbol none
    bell_on_tab no
    tab_separator ""
    tab_bar_margin_width 0.0
    tab_bar_margin_height 0.0 0.0
    tab_title_template "{f'{title[:30]}…' if title.rindex(title[-1]) + 1 > 30 else (title.center(6) if (title.rindex(title[-1]) + 1) % 2 == 0 else title.center(5))}"
    active_tab_font_style   bold


    #symbol_map U+e000-U+e00a,U+ea60-U+ebeb,U+e0a0-U+e0c8,U+e0ca,U+e0cc-U+e0d7,U+e200-U+e2a9,U+e300-U+e3e3,U+e5fa-U+e6b1,U+e700-U+e7c5,U+ed00-U+efc1,U+f000-U+f2ff,U+f000-U+f2e0,U+f300-U+f372,U+f400-U+f533,U+f0001-U+f1af0 Symbols Nerd Font Mono
    symbol_map U+23FB-U+23FE,U+2665,U+26A1,U+2B58,U+E000-U+E00A,U+E0A0-U+E0A2,U+E0A3,U+E0B0-U+E0B3,U+E0B4-U+E0C8,U+E0CA,U+E0CC-U+E0D4,U+E200-U+E2A9,U+E300-U+E3E3,U+E5FA-U+E6B1,U+E700-U+E7C5,U+EA60-U+EBEB,U+F000-U+F2E0,U+F300-U+F372,U+F400-U+F532,U+F500-U+FD46,U+F0001-U+F1AF0 Symbols Nerd Font Mono

    #symbol_map U+E0A0-U+E0A3,U+E0C0-U+E0C7 PowerlineSymbols
    #symbol_map U+E5FA-U+E62B,U+E700-U+E7C5,U+F000-U+F2E0,U+E200-U+E2A9,U+F500-U+FD46,U+E300-U+E3EB,U+F400-U+F4A8,U+2665,U+26A1,U+F27C,U+E0A3,U+E0B4-U+E0C8,U+E0CA,U+E0CC-U+E0D2,U+E0D4,U+23FB-U+23FE,U+2B58,U+F300-U+F313,U+E000-U+E00D Symbols Nerd Font Mono

    #meh
    #paste_actions replace-dangerous-control-codes,replace-newline

  '';
}
