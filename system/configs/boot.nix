{ config, lib, pkgs, ... }:
{
  # Install grub
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
    };
    efi.canTouchEfiVariables = true;
  };

  # use linux-zen kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;
}
