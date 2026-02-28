{ config, ... }:
{
  home.file = {
    "sonarr/config/.keep".text = "";
    "media/.keep".text = "";
  };

  virtualisation.quadlet.containers.sonarr = {
    autoStart = true;

    containerConfig = {
      # https://quay.io/repository/linuxserver.io/sonarr?tab=tags
      image = "lscr.io/linuxserver/sonarr:4.0.16";

      environments = {
        TZ = "Europe/Tallinn";
      };
      userns = "keep-id";
      networks = [ "media.network" ];

      volumes = [
        "${config.home.homeDirectory}/sonarr/config:/config:Z"
        "${config.home.homeDirectory}/media:/data:Z"
      ];

      publishPorts = [ "8989:8989" ];
    };
  };
}
