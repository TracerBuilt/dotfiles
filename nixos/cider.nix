{appimageTools}: let
  appimage-file = "../../Cider-linux-appimage-x64.AppImage";
in
  appimageTools.wrapType2 {
    name = "Cider";
    version = "2.5.0";
    src = appimage-file;
  }
