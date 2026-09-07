{ pkgs, ... }:

{
  imports = [
    ./modules/exhibition.nix
    ./modules/playback.nix
    ./modules/syncplay.nix

    ./hardware/raspberry-pi-4.nix
  ];

  networking.networkmanager.enable = true;

  services.openssh.enable = true;

  services.tailscale.enable = true;

  environment.systemPackages = with pkgs; [
    git
    vim
    htop
    tmux
  ];

  users.users.display = {
    isNormalUser = true;
    extraGroups = [
      "video"
      "audio"
      "input"
    ];
  };

  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
  '';

  time.timeZone = "Europe/London";

  system.stateVersion = "26.05";
}

