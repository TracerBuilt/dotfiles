{
  lib,
  fetchFromGitHub,
  rustPlatform,
  pkg-config,
  gtk4,
  gtk4-layer-shell,
}:
rustPlatform.buildRustPackage rec {
  pname = "hyprlauncher";
  version = "v0.2.1";

  src = fetchFromGitHub {
    owner = "hyprutils";
    repo = pname;
    rev = version;
    hash = "sha256-J0obh5QlJLJqAXn1XhHe8mN778z5o2RHbHvmkfZIzME=";
  };

  cargoHash = "sha256-7Oc86EL6elk7GjlY+6D3Hsvy7eoRnwX1sf+hwUmefuw=";

  nativeBuildInputs = [pkg-config];
  buildInputs = [gtk4 gtk4-layer-shell];
  release = true;

  meta = {
    description = "An unofficial GUI for launching applications, built with GTK4 and Rust.";
    homepage = "https://github.com/hyprutils/hyprlauncher";
    license = lib.licenses.unlicense;
    maintainers = [];
  };
}
