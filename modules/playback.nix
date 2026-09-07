{ config, lib, pkgs, exhibition, ... }:

{
  environment.systemPackages = [
    pkgs.mpv
    pkgs.syncplay
  ];

  # Generate playback services from exhibition.screens
  systemd.services =
    lib.listToAttrs (
      map
        (screen: {
          name = "exhibition-${screen.video}";

          value = {
            wantedBy = [ "graphical-session.target" ];

            serviceConfig = {
              User = "display";
              Restart = "always";
            };

            script = ''
              exec ${pkgs.mpv}/bin/mpv \
                --fullscreen \
                --fs-screen=${screen.output} \
                /var/lib/exhibition/videos/${screen.video}
            '';
          };
        })
        exhibition.screens
    );
}

