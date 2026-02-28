{ config, ... }:
{
  home.file = {
    "jellyfin/config/.keep".text = "";
    "jellyfin/cache/.keep".text = "";
    "media/media/.keep".text = "";
  };
  virtualisation.quadlet.containers.jellyfin = {
    autoStart = true;

    containerConfig = {
      image = "ghcr.io/jellyfin/jellyfin:2026022305";
      autoUpdate = "registry";
      publishPorts = [ "8096:8096/tcp" ];
      userns = "keep-id";
      networks = [ "media.network" ];
      volumes = [
        "${config.home.homeDirectory}/jellyfin/config:/config:Z"
        "${config.home.homeDirectory}/jellyfin/cache:/cache:Z"
        "${config.home.homeDirectory}/media/media:/media:Z"
      ];
    };

    serviceConfig = {
      SuccessExitStatus = [
        "0"
        "143"
      ];
    };
  };
}
