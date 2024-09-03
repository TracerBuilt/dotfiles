{
  programs.git = {
    enable = true;
    extraConfig = {
      color.ui = true;
      core.editor = "nvim";
      credential.helper = "store";
      github.user = "TracerBuilt";
      push.autoSetupRemote = true;
    };
    userEmail = "tyler@tracerbuilt.dev";
    userName = "Tyler Ward";
  };
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
  };
  services.ssh-agent.enable = true;
}
