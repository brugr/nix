{ config, lib, pkgs, ... }:
{
  # enable flatpak  
  services.flatpak.enable = true;
  
  # autodetect appimages and run them with appimage-run
  programs.appimage = {
    enable = true;
    binfmt  = true;
  };

  # enable podman
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  # enable qemu/libvirtd
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  systemd.tmpfiles.rules = [
    "f /dev/shm/looking-glass 0660 kevin libvirtd -"
  ];
  
  programs = {
    autojump.enable = true;
  };

  services = {
    pcscd.enable = true;
    system76-scheduler.enable = true;
  };

  services.system76-scheduler.assignments = {
    easyeffects = {
      nice = -15;
      class = "fifo";
      prio = 49;
      ioClass = "realtime";
      ioPrio = 0;
      matchers = [ "/app/bin/easyeffects" ];
    };
  };

  environment.systemPackages = (with pkgs; [
    nvtopPackages.full
    btop
    topgrade
    
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

  # enable v4l2loopback (for obs)
  boot.extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
}
