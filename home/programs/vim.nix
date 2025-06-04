{
  pkgs,
  ...
}:
{
  programs.vim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      editorconfig-vim
    ];
    extraConfig = ''
      set mouse=a
      set clipboard=unnamed
    '';
  };
}
