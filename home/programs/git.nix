{
  # TODO: Setup ssh config for different ssh keys for different project
  programs.git = {
    enable = true;
    extraConfig = {
      alias = {
        st = "status";
        lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
        please = "push --force-with-lease";
        rm-merged = "!git br | awk '$2 == \"[gone]\" { print $1 }' | xargs -r git branch -D";
        sync = "!git switch $(git remote show origin | sed -n '/HEAD branch/s/.*: //p') && git pull --prune && git rm-merged";
        br = "!git branch --format '%(refname:short) %(upstream:track)'";
      };
      commit = {
        gpgsign = true;
      };
      core = {
        editor = "vim";
      };
      gpg = {
        format = "ssh";
      };
      push = {
        autoSetupRemote = true;
      };
      user = {
        name = "Jaan Jahilo";
        email = "jaanjahilo@outlook.com";
        signingKey = "~/.ssh/id_ed25519.pub";
      };
    };
  };
}
