{ config, lib, pkgs, ...}:
{
  # enable gnome and gdm
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # install packages
  environment.systemPackages = (with pkgs; [
    kdePackages.ocean-sound-theme
    blackbox-terminal
  ]) ++ (with pkgs.gnome; [
    gnome-tweaks
    nautilus-python
  ]) ++ (with pkgs.gnomeExtensions; [
    # gnome extensions
    gsconnect
    pano
    pop-shell
    appindicator
  ]);

  # add blackbox term to nautilus
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "blackbox";
  };

  # remove unwanted packages
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    loupe
    gnome-connections
    snapshot
    gnome-console
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    gnome-terminal
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
    gnome-contacts
    gnome-weather
    gnome-clocks
    gnome-maps
    gnome-calculator
    simple-scan
    gnome-calendar
    yelp
    seahorse
  ]);
}
