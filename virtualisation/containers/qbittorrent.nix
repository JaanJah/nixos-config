{ config, ... }:
{
  home.file = {
    "qbittorrent/config/.keep".text = "";
    "media/torrents/.keep".text = "";
  };

  virtualisation.quadlet.containers.qbittorrent = {
    autoStart = true;

    containerConfig = {
      # https://quay.io/repository/linuxserver.io/qbittorrent?tab=tags
      image = "lscr.io/linuxserver/qbittorrent:5.1.4";

      environments = {
        TZ = "Europe/Tallinn";
        WEBUI_PORT = "8080";
        TORRENTING_PORT = "6881";
      };
      userns = "keep-id";
      networks = [ "media.network" ];

      volumes = [
        "${config.home.homeDirectory}/qbittorrent/config:/config:Z"
        "${config.home.homeDirectory}/media/torrents:/data/torrents:Z"
      ];

      publishPorts = [
        "8080:8080"
        "6881:6881"
        "6881:6881/udp"
      ];
    };
  };
}
