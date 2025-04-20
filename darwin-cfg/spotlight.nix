{ config, pkgs, lib, ... }:

{
  home.activation.restrictSpotlight = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    echo "Restricting Spotlight to only show apps and settings..."

    defaults write com.apple.Spotlight orderedItems -array \
      '{"enabled" = 1; "name" = "APPLICATIONS";}' \
      '{"enabled" = 1; "name" = "SYSTEM_PREFS";}' \
      '{"enabled" = 0; "name" = "DOCUMENTS";}' \
      '{"enabled" = 0; "name" = "DIRECTORIES";}' \
      '{"enabled" = 0; "name" = "PDF";}' \
      '{"enabled" = 0; "name" = "FONTS";}' \
      '{"enabled" = 0; "name" = "MESSAGES";}' \
      '{"enabled" = 0; "name" = "CONTACT";}' \
      '{"enabled" = 0; "name" = "EVENT_TODO";}' \
      '{"enabled" = 0; "name" = "IMAGES";}' \
      '{"enabled" = 0; "name" = "BOOKMARKS";}' \
      '{"enabled" = 0; "name" = "MUSIC";}' \
      '{"enabled" = 0; "name" = "MOVIES";}' \
      '{"enabled" = 0; "name" = "PRESENTATIONS";}' \
      '{"enabled" = 0; "name" = "SPREADSHEETS";}' \
      '{"enabled" = 0; "name" = "SOURCE";}'

    killall mds > /dev/null 2>&1 || true
    sudo mdutil -E / > /dev/null 2>&1 || true
    sudo mdutil -i on / > /dev/null 2>&1 || true
  '';
}

