{
  # https://wiki.nixos.org/wiki/Python#Using_uv
  programs.uv = {
    enable = true;
    # https://docs.astral.sh/uv/reference/settings
    settings = {
      python-downloads = "never";
      python-preference = "only-system";
    };
  };
}
