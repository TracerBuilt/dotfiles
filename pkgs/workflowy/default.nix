{
  lib,
  makeWrapper,
  appimageTools,
}:
appimageTools.wrapType2 rec {
  pname = "WorkFlowy";
  version = "2023.09.21";
  src = ./WorkFlowy-x86_64.AppImage;

  extraInstallCommands = ''

    source "${makeWrapper}/nix-support/setup-hook"

    wrapProgram $out/bin/${pname} --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations}}"

    install -m 444 -D ${src} -t $out/bin

  '';

  meta = with lib; {
    description = "New look into listening and enjoying Apple Music in style and performance";

    homepage = "https://workflowy.com";

    mainProgram = "workflowy";

    platforms = ["x86_64-linux"];
  };
}
