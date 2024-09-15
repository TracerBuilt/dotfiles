{
  inputs,
  system,
  ...
}: {
  environment.systemPackages = with inputs.nix-alien.packages.${system}; [
    nix-alien
  ];

  programs.nix-ld.enable = true;
}
