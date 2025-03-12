# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
pkgs: {
  # example = pkgs.callPackage ./example { };
  cider-2 = pkgs.callPackage ./cider {};
  workflowy = pkgs.callPackage ./workflowy {};
  noi = pkgs.callPackage ./noi {};
}
