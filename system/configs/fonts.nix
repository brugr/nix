{ config, pkgs, ...}:
{
  fonts.packages = (with pkgs; [
    twitter-color-emoji
    nerdfonts

    noto-fonts
    ubuntu_font_family
    fira
    fira-mono
    liberation_ttf
  ]);
  fonts.fontconfig.defaultFonts.emoji = [ "Twitter Color Emoji" ];
}
