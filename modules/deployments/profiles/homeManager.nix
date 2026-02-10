{ self, ... }: {
  flake.modules.homeManager = with self.modules.homeManager; {
    bundle-terminal-base.imports = [
      # Files
      bat
      dua
      dust
      eza
      fd
      ouch
      ripgrep
      ripgrep-all
      sd
      tealdeer

      # Nix
      nix-index-database
      nix-tools

      # Security
      gpg
      rbw

      # Shell
      carapace
      direnv
      fish
      fzf
      skim
      starship
      yazi
      zellij
      zoxide
    ];

    bundle-terminal-extended.imports = [
      # Files
      ast-grep

      # System information
      fastfetch

      # Monitoring
      bandwhich
      bottom
      hyperfine
      procs
      tokei

      # Parsers
      fx
      jq
      mdcat

      # Web
      xh
    ];

    bundle-development.imports = [
      # Assistants
      aichat
      claude-code

      # Editor
      helix

      # Tools
      just
      repomix

      # Versioning
      git
      delta
      lazygit

      # Virtualization
      docker

      # Workflow
      bacon
      watchexec
    ];

    bundle-cloud.imports = [
      # Kubernetes
      argocd
      helm
      k9s
      kubernetes

      # S3
      aws-cli
    ];

    bundle-desktop.imports = [
      # Applications
      firefox
      thunderbird

      # Compsitor
      niri

      # Emulator
      ghostty

      # Editor
      zed

      # Shell
      dms
      dms-plugins
    ];
  };
}
