{ config, lib, ... }:
{
  networking = {
    networkmanager.enable = true; # enable networkmanager
  };
  
  # enable tcp_bbr
  boot = {
    kernelModules = ["tcp_bbr"];
    kernel.sysctl = {
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.default_qdisc" = "fq";
      "net.core.wmem_max" = 1073741824;
      "net.core.rmem_max" = 1073741824;
      "net.ipv4.tcp_rmem" = "4096 87380 1073741824";
      "net.ipv4.tcp_wmem" = "4096 87380 1073741824";
    };
  };
}
