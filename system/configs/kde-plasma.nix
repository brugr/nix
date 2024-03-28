{ config, lib, pkgs, ... }:
{
  services.xserver = {
    enable = true;
#    displayManager.sddm.enable = true;
#    displayManager.sddm.wayland.enable = true;
  };
  services.desktopManager.plasma6.enable = true;
#  services.packagekit.enable = true;
  services.fwupd.enable = true;
  
#  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
#  xdg.portal.gtkUsePortal = false;
  programs.dconf.enable = true;
  services.gvfs.enable = true;

  programs.kdeconnect.enable = true;

  environment.systemPackages = (with pkgs.kdePackages; [
    discover
    kconfig
    plasma-browser-integration
    kio-fuse
    kaccounts-integration
    kaccounts-providers
    qtwebengine
    packagekit-qt
  ]);
}
