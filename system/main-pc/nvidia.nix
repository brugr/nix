{ config, pkgs, ...}:
{
  services.xserver.videoDrivers = [ "nvidia" ];

  boot = {
	extraModprobeConfig = "options nvidia-drm modeset=1";
	initrd.kernelModules = [ "nvidia_modeset" "nvidia" "nvidia_drm" ];
  };

  boot.blacklistedKernelModules = [ "nouveau" ];

  services.switcherooControl.enable = true;

  hardware.opengl = {
	enable = true;
	driSupport = true;
	driSupport32Bit = true;
  };

  hardware.nvidiaOptimus.disable = false;
 
  hardware.nvidia = {
	package = config.boot.kernelPackages.nvidiaPackages.latest;
	modesetting.enable = true;
	powerManagement = {
  	  enable = false;
  	  finegrained = false;
	};
	open = true;
	nvidiaSettings = true;
	nvidiaPersistenced = true;
	prime = {
  	  offload = {
  	    enable = true;
  	    enableOffloadCmd = true;
  	  };
  	sync.enable = false;
  	intelBusId = "PCI:7:0:0";
  	nvidiaBusId = "PCI:1:0:0";
	};
  };
  systemd = {
    services.systemd-udev-trigger.restartIfChanged = false;
    timers."nvidia-tdp" = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnBootSec = "5";
        Unit = "nvidia-tdp.service";
      };
    };
    services."nvidia-tdp" = {
      path = [
        config.boot.kernelPackages.nvidia_x11
        config.boot.kernelPackages.nvidia_x11.settings
      ];
      serviceConfig = {
        Type = "oneshot";
        ExecStartPre = "/usr/bin/env nvidia-smi -pm 1";
        ExecStart = "/usr/bin/env nvidia-smi -pl 450";
      };
    };
  };
}

