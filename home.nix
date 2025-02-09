{ config, pkgs, thecomet-nvim, ... }:
{
  xdg.configFile."nvim".source = thecomet-nvim;

  home = {
    username = "thecomet";
    homeDirectory = "/home/thecomet";
    stateVersion = "24.11";
    sessionVariables = {
      EDITOR = "vim";
    };

    packages = with pkgs; [
      ffmpeg
      htop
    ];
  };

  programs = {
    #home-manager.enable = true;
    git = {
      enable = true;
      userName = "TheComet";
      userEmail = "alex.murray@gmx.ch";
    };

    neovim = {
      enable = true;
      extraPackages = with pkgs; [
        gcc     # Treesitter
        unzip   # Mason needs to unzip clangd
        ripgrep # Telescope
      ];
    };

    tmux = {
      enable = true;
      prefix = "C-z";
      keyMode = "vi";
      terminal = "tmux-256color";
      escapeTime = 0; # This is annoying
      baseIndex = 1;
      plugins = with pkgs; [
        tmuxPlugins.catppuccin
      ];
      extraConfig = builtins.readFile ./tmux.conf;
    };

    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        nv = "nvim .";
        mv = "mv -i";
      };
      oh-my-zsh = {
        enable = true;
        theme = "fino";
        plugins = [
          "git"
        ];
      };
    };
  };
}

