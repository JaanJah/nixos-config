{ config, ... }:
{
  home.file = {
    "jackett/config/.keep".text = "";
    "media/downloads/.keep".text = "";
  };

  virtualisation.quadlet.containers.jackett = {
    autoStart = true;

    containerConfig = {
      # https://quay.io/repository/linuxserver.io/jackett?tab=tags
      image = "lscr.io/linuxserver/jackett:0.24.1226";

      environments = {
        TZ = "Europe/Tallinn";
      };
      userns = "keep-id";
      networks = [ "media.network" ];
      volumes = [
        "${config.home.homeDirectory}/jackett/config:/config:Z"
        "${config.home.homeDirectory}/media/torrents:/downloads:Z"
      ];

      publishPorts = [ "9117:9117" ];
    };
  };
}
