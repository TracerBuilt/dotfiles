{inputs, ...}: {
  modifications = final: prev: {
    nwg-look = prev.nwg-look.overrideAttrs (oldAttrs: rec {
      version = "1.0.3";
      src = prev.fetchFromGitHub {
        owner = "Niapollab";
        repo = "nwg-look";
        rev = "v${version}";
        sha256 = "sha256-gX92gL+m0huD1Wq7JoGNqsGrUjiBrwpOf8G6wt5xztI=";
      };
    });
  };
}
