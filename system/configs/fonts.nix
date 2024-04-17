{ config, pkgs, ...}:
{
  fonts.fontDir.enable = true;
  fonts.packages = (with pkgs; [
    (nerdfonts.override { fonts = [ "CascadiaCode" "CascadiaMono" ]; })
    font-awesome

    noto-fonts
    ubuntu_font_family
    fira
    fira-mono

    corefonts
    vistafonts

    twemoji-color-font
    noto-fonts-color-emoji
  ]);
  fonts.fontconfig.defaultFonts.emoji = [ "Twitter Color Emoji" "Noto Color Emoji" ];
}
