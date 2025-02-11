{config, ...}: {
  sops = {
    age.keyFile = "/home/goose/.config/sops/age/keys.txt"; # must have no password!

    defaultSopsFile = ./secrets.yaml;
    defaultSymlinkPath = "/run/user/1000/secrets";
    defaultSecretsMountPoint = "/run/user/1000/secrets.d";

    secrets.HUGGINGFACE_INFERENCE_TOKEN = {
      # sopsFile = ./secrets.yml.enc; # optionally define per-secret files
      path = "${config.sops.defaultSymlinkPath}/HUGGINGFACE_INFERENCE_TOKEN";
    };
  };
}
