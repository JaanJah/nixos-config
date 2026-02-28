{ config, ... }:
{
  home.file = {
    "prowlarr/config/.keep".text = "";
  };

  virtualisation.quadlet.containers.prowlarr = {
    autoStart = true;

    containerConfig = {
      # https://quay.io/repository/linuxserver.io/prowlarr?tab=tags
      image = "lscr.io/linuxserver/prowlarr:2.3.0";

      environments = {
        TZ = "Europe/Tallinn";
      };
      userns = "keep-id";
      networks = [ "media.network" ];

      volumes = [
        "${config.home.homeDirectory}/prowlarr/config:/config:Z"
      ];

      publishPorts = [ "9696:9696" ];
    };
  };
}
