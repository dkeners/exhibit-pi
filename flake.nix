{
  description = "Exhibit Pi Sync Setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, nixos-hardware, ... }:
    let
      system = "aarch64-linux";
    in {
      nixosConfigurations = {

        PI01 = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            nixos-hardware.nixosModules.raspberry-pi-4

            ./modules/configuration.nix
          ];

          specialArgs = {
            exhibition = {
              screens = [
                {
                  output = "HDMI-A-1";
                  video = "video-01.mp4";
                }
              ];

	      syncplayServer = true;
            };
          };
        };

        PI02 = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            nixos-hardware.nixosModules.raspberry-pi-4

            ./modules/configuration.nix
          ];

          specialArgs = {
            exhibition = {
              screens = [
                {
                  output = "HDMI-A-1";
                  video = "video-02.mp4";
                }
                {
                  output = "HDMI-A-2";
                  video = "video-03.mp4";
                }
              ];

	      syncplayServer = false;
            };
          };
        };

        PI03 = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            nixos-hardware.nixosModules.raspberry-pi-4

            ./modules/configuration.nix
          ];

          specialArgs = {
            exhibition = {
              screens = [
                {
                  output = "HDMI-A-1";
                  video = "video-04.mp4";
                }
                {
                  output = "HDMI-A-2";
                  video = "video-05.mp4";
                }
              ];

	      syncplayServer = false;
            };
          };
        };
      };
    };
}
