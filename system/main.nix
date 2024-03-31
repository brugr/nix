{ config, ... }:
{
  imports = [
    ./configs/boot.nix
    ./configs/users.nix
    ./configs/networking.nix
    ./configs/locale.nix
    ./configs/audio.nix
    ./configs/gnome.nix
    ./configs/programs.nix
    ./configs/fonts.nix
    ./configs/nix-settings.nix
  ];
}
