{ config, lib, pkgs, ... }:
{
  users.users.kevin = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "flatpak" ];
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;

  users.users.root.hashedPassword = "!";  # disable root
}
