{ config, lib, pkgs, ... }:
{
    programs = {
        steam.enable = true;
    };

    environment.systemPackages = with pkgs; [
        mangohud
        gamescope
        r2modman
    ];
}

