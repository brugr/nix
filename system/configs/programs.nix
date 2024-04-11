{ config, lib, pkgs, ... }:
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

  # enable podman
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  # enable qemu/libvirtd
  virtualisation.libvirtd.enable = true;
  
  programs = {
    autojump.enable = true;
    coolercontrol.enable = true;
    steam.enable = true;
    virt-manager.enable = true;
  };

  services = {
    pcscd.enable = true;
  };

  # enable v4l2loopback (for obs)
  boot.extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
  
  # fix nvidia for coolercontrol
  systemd.services.coolercontrold.path = [
    pkgs.bash
    config.boot.kernelPackages.nvidia_x11
    config.boot.kernelPackages.nvidia_x11.settings
  ];

  systemd.tmpfiles.rules = [
    "f /dev/shm/looking-glass 0660 kevin libvirtd -"
  ];

  environment.systemPackages = (with pkgs; [
    nvtopPackages.full
    btop
    topgrade
    
    intel-media-driver
    
    vesktop
    bitwarden
    yubioath-flutter
    looking-glass-client
    
    chezmoi
    git
    git-lfs
    wget
    gnupg
    
    distrobox
    
    flatpak-builder

    mangohud
    gamescope
    r2modman
    
    papirus-icon-theme
    adw-gtk3
    
    android-tools
    vscode

    obs-studio
  ]) ++ (with pkgs.obs-studio-plugins; [
    obs-vkcapture
    obs-gstreamer
    obs-vaapi
    obs-pipewire-audio-capture
  ]);
}
