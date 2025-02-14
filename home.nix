{ config, pkgs, ... }:
{
  xdg.configFile."nvim".source = ./nvim-config;

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
        python3 # justifier.py
      ];
      plugins = with pkgs.vimPlugins; [
        cmake-tools-nvim
        conflict-marker-vim
        fugitive
        harpoon
        luasnip
        #  nvim-cmp
        #  cmp-nvim-lua
        #  cmp-nvim-lsp
        #  cmp-buffer
        #  cmp_luasnip
        #  cmp-luasnip-choice
        mini-cursorword
        mini-hipatterns
        mini-splitjoin
        mini-surround
        multicursors-nvim
        (nvim-treesitter.withPlugins (p: with p; [
          awk asm c cpp csv disassembly git_config git_rebase gitattributes
          gitcommit gitignore glsl hlsl json latex lua luadoc make markdown
          nix passwd python regex rust sql ssh_config toml udev vim vimdoc xml
          yaml
        ]))
        nvim-treesitter-context
        rainbow-delimiters-nvim
        telescope-nvim
        telescope-undo-nvim
        trouble-nvim
        undotree
        vim-tmux-navigator
        which-key-nvim
        # TODO:
        #   FabijanZulj/blame.nvim
        #   MysticalDevil/inlay-hints.nvim
        #   FotiadisM/tabset.nvim
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

