{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };
}
