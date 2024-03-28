{ config, lib, ... }:
{
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" "sv_SE.UTF-8/UTF-8" ];
#  i18n.extraLocaleSettings = {
#    LANGUAGE = "en_US.UTF-8";
#    LC_ADDRESS = "sv_SE.UTF-8";
#    LC_CTYPE = "en_US.UTF-8";
#    LC_MONETARY = "sv_SE.UTF-8";
#    LC_MESSAGES = "en_US.UTF-8";
#    LC_MEASUREMENT = "sv_SE.UTF-8";
#    LC_NAME = "en_US.UTF-8";
#    LC_NUMERIC = "sv_SE.UTF-8";
#    LC_PAPER = "sv_SE.UTF-8";
#    LC_TELEPHONE = "sv_SE.UTF-8";
#    LC_TIME = "en_SE.UTF-8";
#  };
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkb.options in tty.
  };

  services.xserver.xkb.layout = "se";
}
