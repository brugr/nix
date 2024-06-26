{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./nvidia.nix

      ../main.nix
      ../configs/gaming.nix
    ];

  boot.kernelParams = [ "amd_pstate=active" ];

  # Set your time zone.
  time.timeZone = "Europe/Stockholm";
  
  networking.hostName = "main-pc";

  environment.sessionVariables = {
    DXVK_FILTER_DEVICE_NAME =  "NVIDIA GeForce RTX 3090";
    MANGOHUD = "1";
  };

  zramSwap.enable = true;
  services.fstrim.enable = true;

  hardware.opengl.extraPackages = with pkgs; [ intel-media-driver ];
  
  programs.coolercontrol.enable = true;
  # fix nvidia for coolercontrol
#  systemd.services.coolercontrold.path = [
#    pkgs.bash
#    config.boot.kernelPackages.nvidia_x11
#    config.boot.kernelPackages.nvidia_x11.settings
#  ];

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

}

