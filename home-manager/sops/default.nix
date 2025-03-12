{config, ...}: {
  sops = {
    age.keyFile = "/home/goose/.config/sops/age/keys.txt"; # must have no password!

    defaultSopsFile = ./secrets.yaml;
    defaultSymlinkPath = "/run/user/1000/secrets";
    defaultSecretsMountPoint = "/run/user/1000/secrets.d";

    secrets = {
      huggingface_inference_token = {
        # sopsFile = ./secrets.yml.enc; # optionally define per-secret files
        path = "${config.sops.defaultSymlinkPath}/huggingface_inference_token";
      };

      gemini_api_key = {
        path = "${config.sops.defaultSymlinkPath}/gemini_api_key";
      };

      google_search_engine_id = {
        path = "${config.sops.defaultSymlinkPath}/google_search_engine_id";
      };

      google_search_api_key = {
        path = "${config.sops.defaultSymlinkPath}/google_search_api_key";
      };

      groq_api_key = {
        path = "${config.sops.defaultSymlinkPath}/grok_api_key";
      };

      openrouter_api_key = {
        path = "${config.sops.defaultSymlinkPath}/openrouter_api_key";
      };
    };
  };
}
