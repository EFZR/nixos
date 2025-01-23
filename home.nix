{ config, pkgs, inputs, ... }:
let
  neovimconfig = import ./nvim-configs;
  nvim = inputs.nixvim.legacyPackages.x86_64-linux.makeNixvimWithModule {
    inherit pkgs;
    module = neovimconfig;
  };

in {

  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  home.username = "efzr";
  home.homeDirectory = "/home/efzr";

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  home.sessionVariables = {
    EDITOR = "vim";
    NIX_SHELL_PRESERVE_PROMPT = 1;
  };

  # Packages that should be installed to the user profile.
  # Combined packages for both `home.packages` and `environment.systemPackages`.
  home.packages = with pkgs; [
    # Command-line tools
    fastfetch
    nnn
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # Archives
    zip
    xz
    unzip
    p7zip

    # Utilities
    ripgrep
    jq
    yq-go
    eza
    fzf

    # Networking tools
    mtr
    iperf3
    dnsutils
    ldns
    aria2
    socat
    nmap
    ipcalc

    # Nix related
    nix-output-monitor

    # Productivity
    hugo
    glow
    lazygit
    gh

    # Monitoring tools
    btop
    iotop
    iftop

    # System call monitoring
    strace
    ltrace
    lsof

    # System tools
    sysstat
    lm_sensors
    ethtool
    pciutils
    usbutils

    # Developer tools
    nvim
    wget
    git
    tmux
    zig
    fd
    cmake
    zsh
    direnv
    gcc
    docker

    # vscode-langservers-extracted
    # marksman
    # omnisharp-roslyn
    # netcoredbg
    # nixfmt-classic

    # TODO: Work this pkgs in shells.nix
    ## dotnetCorePackages.sdk_8_0
    ## rustup
    ## nodejs
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "efzr";
    userEmail = "emerson.zapatarivas@gmail.com";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      eval "$(direnv hook zsh)"
    '';

    shellAliases = {
      ll = "ls -l";
      parrot = "curl parrot.live";
      update = "sudo nixos-rebuild switch";
      updateGit =
        "sudo nixos-rebuild switch --flake github:efzr/Nix-Configs/main";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    # With Oh-My-Zsh:
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
      # theme = "Agnoster";
      # theme = "simple";
      # theme = "half-life";
      # theme = "eastwood";
      # theme = "geoffgarside";
    };
  };

  programs.direnv.enable = true;

  programs = {
    tmux = {
      enable = true;
      clock24 = true;
      extraConfig = ''
        # remap prefix from 'C-b' to 'C-a'
        unbind C-b
        set-option -g prefix C-a
        bind-key C-a send-prefix

        # remap prefix from 'C-b' to 'C-a'
        unbind C-b
        set-option -g prefix C-a
        bind-key C-a send-prefix

        # switch panes using Alt-arrow without prefix
        bind h select-pane -L
        bind l select-pane -R
        bind k select-pane -U
        bind j select-pane -D

        # Enable mouse control (clickable windows, panes, resizable panes)
        set -g mouse on
      '';
    };
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";
  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
