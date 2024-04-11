{ config, lib, pkgs, ...}:
{
  # enable gnome and gdm
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # enable gsconnect
  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

  # install packages
  environment.systemPackages = (with pkgs; [
    kdePackages.ocean-sound-theme
  ]) ++ (with pkgs.gnome; [
    gnome-tweaks
    nautilus-python
    gnome-terminal
  ]) ++ (with pkgs.gnomeExtensions; [
    # gnome extensions
    pano
    pop-shell
    appindicator
  ]);

  # nautilus open any terminal
  #programs.nautilus-open-any-terminal = {
  #  enable = true;
  #  terminal = "gnome-terminal";
  #};

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
