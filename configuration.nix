{ config, lib, pkgs, ... }:
{
  #imports =
  #  [ # Include the results of the hardware scan.
  #    ./hardware-configuration.nix
  #  ];
  virtualisation.vmVariant = {
    virtualisation = {
      memorySize = 16 * 1024;
      cores = 16;
      diskSize = 32 * 1024;
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "nodev"; # "nodev" for efi only

  networking.hostName = "nixos";

  time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;  #keyMap = "us";
  };

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.thecomet = {
    name = "thecomet";
    initialPassword = "123";
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3xuMQTEFed8liMZuKzbCrIdimcvRfzFTc+UcuMUzlr6qrVm+Ps76T5UypLhW+j22B1TKqyuXvsDOlEL5UDWwHQ92VFPghC/mBZBt44tMeaFYuN1E0Np6lPD4oQnnE7GrDVxPDGBACr98t+PYWUueAF8Terf+ICRsK6F/gfd+//YGh53/lpCvabmz9M2huk/AkUpDzftrcJdNpCHdRGL5w+0ILUhtRiIFwkoH3kidQlnAZQbL2xjtP5wflOHiTiDNajUz+33GoMaCygt/z5Dznlgeyl+axAOPxpspdC8Xi5BGCaHuLtnwWANqEyeacPUkpgHVk4sjaISBTaMwTUyTH megamashmothers@gmail.com" ];
  };
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    # Language servers
    clang-tools
    lua-language-server
  ];
  environment.variables.EDITOR = "vim";

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];

  system.stateVersion = "24.11"; # Did you read the comment?
}

