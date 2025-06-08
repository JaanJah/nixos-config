{ ... }:
{
  programs.firefox = {
    enable = true;
    policies = {
      ExtensionSettings =
        with builtins;
        let
          extension = shortId: uuid: {
            name = uuid;
            value = {
              install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
              installation_mode = "normal_installed";
            };
          };
        in
        # Find id in about:support#addons
        listToAttrs [
          (extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
          (extension "imagus" "{00000f2a-7cde-4f20-83ed-434fcb420d71}")
          (extension "tampermonkey" "firefox@tampermonkey.net")
          (extension "ublock-origin" "uBlock0@raymondhill.net")
        ];
    };
  };
}
