{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    # ./modules/exhibition.nix
    ./playback.nix
    ./syncplay.nix
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

  systemd.sleep.settings.Sleep = {
    AllowSuspend = false;
    AllowHibernation = false;
    AllowHybridSleep = false;
    AllowSuspendThenHibernate = false;
  };

  time.timeZone = "Europe/London";

  system.stateVersion = "26.05";
}

