{ config, ... }:
{
  home.file = {
    "radarr/config/.keep".text = "";
    "media/.keep".text = "";
  };

  virtualisation.quadlet.containers.radarr = {
    autoStart = true;

    containerConfig = {
      # https://quay.io/repository/linuxserver.io/radarr?tab=tags
      image = "lscr.io/linuxserver/radarr:6.0.4";

      environments = {
        TZ = "Europe/Tallinn";
      };
      userns = "keep-id";
      networks = [ "media.network" ];

      volumes = [
        "${config.home.homeDirectory}/radarr/config:/config:Z"
        "${config.home.homeDirectory}/media:/data:Z"
      ];

      publishPorts = [ "7878:7878" ];
    };
  };
}
