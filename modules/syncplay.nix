{ config, lib, pkgs, exhibition, ... }:

{
  services.syncplay = lib.mkIf exhibition.syncplayServer {
    enable = true;
    port = 8999;
  };
}

