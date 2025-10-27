{ config, lib, pkgs, ... }: let
  vimLua = lua: ''
    lua << EOF
    ${lua}
    EOF
  '';
in {
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      gcc           # Treesitter
      ripgrep       # Telescope fuzzy search
      fd            # Telescope sharkdp/fd find utility
      python3       # justifier.py
      clang-tools   # C/C++ language server
      lua-language-server
    ];
    plugins = with pkgs.vimPlugins; [
      # Colorschemes
      catppuccin-nvim
      tokyonight-nvim
      kanagawa-nvim
      nightfox-nvim
      nightfly

      # misc
      which-key-nvim
      #harpoon
      rainbow-delimiters-nvim
      multicursors-nvim
      mini-icons
      mini-surround
      mini-splitjoin
      mini-hipatterns
      mini-cursorword
      nvim-web-devicons
      #undotree
      #vim-tmux-navigator
      
      # Telescope
      telescope-nvim
      telescope-undo-nvim

      # Git
      #conflict-marker-nvim
      #fugitive

      # Treesitter
      (nvim-treesitter.withPlugins (p: with p; [
        awk asm c cpp csv disassembly git_config git_rebase gitattributes
        gitcommit gitignore glsl hlsl json latex lua luadoc make markdown
        nix passwd python regex sql ssh_config toml udev vim vimdoc xml
        yaml
      ]))
      nvim-treesitter-context

      # LSP
      lazydev-nvim  # Lua completion for neovim

      # Completion
      nvim-cmp
      cmp-buffer
      cmp-nvim-lua
      cmp-nvim-lsp
      cmp_luasnip
      luasnip

      # C/C++
      cmake-tools-nvim

      # TODO
      #FabijanZulj/blame.nvim
      #MysticalDevil/inlay-hints.nvim
      #FotiadisM/tabset.nvim
    ];
    extraConfig = with builtins; vimLua (
      lib.foldl (r: f: r + "\n" + readFile f) "" [
        ./which-key.lua
        ./options.lua
        ./keymap.lua
        ./colorscheme.lua
        ./telescope.lua
        ./cmake.lua
        ./ngspice.lua
        ./lsp.lua
        ./gdb.lua
      ]
    );
    withNodeJs = false;
    withPython3 = false;
  };
}
