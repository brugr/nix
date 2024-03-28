{ config, pkgs, ... }:
{
  # enable flatpak  
  services.flatpak.enable = true;
  
  # autodetect appimages and run them with appimage-run
  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
    magicOrExtension = ''\x7fELF....AI\x02'';
  };

  # enable podman and nvidia support
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
  virtualisation.containers.cdi.dynamic.nvidia.enable = true;

  
  programs = {
    autojump.enable = true;
    coolercontrol.enable = true;
    steam.enable = true;
  };

  services = {
    pcscd.enable = true;
  };
  
  # fix nvidia for coolercontrol
  systemd.services.coolercontrold.path = [
    pkgs.bash
    config.boot.kernelPackages.nvidia_x11
    config.boot.kernelPackages.nvidia_x11.settings
  ];

  environment.systemPackages = (with pkgs; [
    nvtopPackages.full
    btop
    topgrade
    
    intel-media-driver
    
    vesktop
    
    chezmoi
    git
    git-lfs
    wget
    gnupg
    
    distrobox
    
    flatpak-builder

    mangohud
    gamescope
    
    papirus-icon-theme
    adw-gtk3
    
  ]);
}
