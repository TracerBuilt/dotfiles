{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.wezterm = {
    enable = true;
    font = "CaskaydiaCove NF";
  };
}
