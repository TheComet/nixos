{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "thecomet";
    userEmail = "alex.murray@gmx.ch";
  };
}
