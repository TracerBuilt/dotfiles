{
  lib,
  makeWrapper,
  appimageTools,
}:
appimageTools.wrapType2 rec {
  pname = "Cider";

  version = "2.6.1";

  src = ./cider-linux-x64.AppImage;

  extraInstallCommands = ''

    source "${makeWrapper}/nix-support/setup-hook"

    wrapProgram $out/bin/${pname} --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations}}"

    install -m 444 -D ${src} -t $out/bin

  '';

  meta = with lib; {
    description = "New look into listening and enjoying Apple Music in style and performance";

    homepage = "https://github.com/ciderapp/Cider";

    license = licenses.agpl3Only;

    mainProgram = "cider";

    maintainers = [maintainers.cigrainger];

    platforms = ["x86_64-linux"];
  };
}
