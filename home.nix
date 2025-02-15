{ config, pkgs, pkgs-unstable, ... }:
{
  xdg.configFile."nvim/init.lua".text = builtins.readFile ./nvim-config/init.lua;
  xdg.configFile."nvim/lua/thecomet/options.lua".text = builtins.readFile ./nvim-config/lua/thecomet/options.lua;
  xdg.configFile."nvim/lua/thecomet/keymap.lua".text = builtins.readFile ./nvim-config/lua/thecomet/keymap.lua;

  xdg.configFile."nvim/lua/thecomet/justifier.py".source = ./nvim-config/lua/thecomet/justifier.py;

  xdg.configFile."nvim/lua/thecomet/colorscheme.lua".text = builtins.readFile ./nvim-config/lua/thecomet/colorscheme.lua;
  xdg.configFile."nvim/lua/thecomet/completion.lua".text = builtins.readFile ./nvim-config/lua/thecomet/completion.lua;
  xdg.configFile."nvim/lua/thecomet/context.lua".text = builtins.readFile ./nvim-config/lua/thecomet/context.lua;
  xdg.configFile."nvim/lua/thecomet/lsp.lua".text = builtins.readFile ./nvim-config/lua/thecomet/lsp.lua;
  xdg.configFile."nvim/lua/thecomet/mini.lua".text = builtins.readFile ./nvim-config/lua/thecomet/mini.lua;
  xdg.configFile."nvim/lua/thecomet/multicursor.lua".text = builtins.readFile ./nvim-config/lua/thecomet/multicursor.lua;
  xdg.configFile."nvim/lua/thecomet/telescope.lua".text = builtins.readFile ./nvim-config/lua/thecomet/telescope.lua;
  xdg.configFile."nvim/lua/thecomet/treesitter.lua".text = builtins.readFile ./nvim-config/lua/thecomet/treesitter.lua;

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
        gcc          # Treesitter
        unzip        # Mason needs to unzip clangd
        ripgrep      # Telescope
        python3      # justifier.py
        clang-tools  # C/C++ language server for LSP client
        lua-language-server
      ];
      plugins = with pkgs.vimPlugins; [
        # Colorschemes
        catppuccin-nvim
        tokyonight-nvim
        kanagawa-nvim
        nightfox-nvim
        nightfly

        # Misc
        #harpoon
        mini-cursorword
        mini-hipatterns
        mini-splitjoin
        mini-surround
        multicursors-nvim
        rainbow-delimiters-nvim
        #undotree
        #vim-tmux-navigator
        #which-key-nvim

        # Telescope
        telescope-nvim
        telescope-undo-nvim

        # Git
        #conflict-marker-vim
        #fugitive

        # Treesitter
        (nvim-treesitter.withPlugins (p: with p; [
          awk asm c cpp csv disassembly git_config git_rebase gitattributes
          gitcommit gitignore glsl hlsl json latex lua luadoc make markdown
          nix passwd python regex rust sql ssh_config toml udev vim vimdoc xml
          yaml
        ]))
        pkgs-unstable.vimPlugins.nvim-treesitter-context  # Enable/Disable toggle not fixed in 24.11

        # LSP
        lazydev-nvim    # Lua completion for nvim
        nvim-lspconfig

        # Completion
        #luasnip
        #nvim-cmp
        #cmp-nvim-lua
        #cmp-nvim-lsp
        #cmp-buffer
        #cmp_luasnip

        # C/C++
        cmake-tools-nvim
        #trouble-nvim

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

