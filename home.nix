{ inputs, lib, config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [];
  programs.home-manager.enable = true;

  imports = [
    ./shell
    ./tmux
    ./neovim
    ./git
  ];

  home = {
    stateVersion = "25.05";
    username = "thecomet";
    homeDirectory = "/home/thecomet";
    sessionVariables = {
      EDITOR = "nvim";
    };
    packages = with pkgs; [
      htop
    ];
  };

  # Reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
