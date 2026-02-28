{ ... }:
{
  virtualisation.quadlet.containers.flaresolverr = {
    autoStart = true;

    containerConfig = {
      # https://github.com/FlareSolverr/FlareSolverr/pkgs/container/flaresolverr
      image = "ghcr.io/flaresolverr/flaresolverr:v3.4.6";

      environments = {
        LOG_LEVEL = "info";
      };
      userns = "keep-id";
      networks = [ "media.network" ];

      publishPorts = [ "8191:8191" ];
    };
  };
}
