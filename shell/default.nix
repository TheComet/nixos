{ config, pkgs, ... }:
{
  imports = [
    ./zsh.nix
  ];

  programs.fzf.enable = true;
}
