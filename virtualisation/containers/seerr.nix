{ config, ... }:
{
  home.file."seerr/config/.keep".text = "";

  virtualisation.quadlet.containers.seerr = {
    autoStart = true;

    containerConfig = {
      # https://hub.docker.com/r/seerr/seerr/tags
      image = "ghcr.io/seerr-team/seerr:v3.1.0";
      notify = "healthy";

      environments = {
        LOG_LEVEL = "debug";
        TZ = "Europe/Tallinn";
        PORT = "5055";
      };

      publishPorts = [ "5055:5055" ];
      userns = "keep-id";
      networks = [ "media.network" ];

      volumes = [
        "${config.home.homeDirectory}/seerr/config:/app/config:Z"
      ];

      healthCmd = "wget --no-verbose --tries=1 --spider http://localhost:5055/api/v1/status || exit 1";
      healthStartPeriod = "20s";
      healthTimeout = "3s";
      healthInterval = "15s";
      healthRetries = 3;
    };
  };
}
