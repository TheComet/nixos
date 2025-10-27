{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    prefix = "C-z";
    keyMode = "vi";
    terminal = "tmux-256color";
    escapeTime = 0;  # This is annoying
    baseIndex = 1;
    plugins = with pkgs; [ tmuxPlugins.catppuccin ];
    extraConfig = builtins.readFile ./tmux.conf;
  };
}
