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
  version = "v0.2.8";

  src = fetchFromGitHub {
    owner = "hyprutils";
    repo = pname;
    rev = version;
    hash = "sha256-yP3g/hWhQj0JwXNbZFMRJrg0a4upOUwDD0EkW1W8acE=";
  };

  cargoHash = "sha256-+5rGkioeaPHGZ9rkXtPms8eM7K8R2MA0wWXu7NJAF88=";

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
