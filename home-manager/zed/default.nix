{
  pkgs,
  lib,
  ...
}: {
  programs.zed-editor = {
    enable = true;

    useSettings = {
    };
  };
}
