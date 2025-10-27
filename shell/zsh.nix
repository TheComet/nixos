{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    autocd = true;
    shellAliases = import ./aliases.nix;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.extended = true;
    initContent = ''
      ZSH_AUTOSUGGEST_USE_ASYNC=1
      ZSH_AUTOSUGGEST_STRATEGY=(history completion)
      bindkey '^y' autosuggest-accept
      # zsh doesn't read /etc/inputrc - fix bindkeys manually
      bindkey "\e[1~" beginning-of-line
      bindkey "\e[4~" end-of-line
    '';
    oh-my-zsh = {
      enable = true;
      #theme = "fino";
      theme = "fox";
      plugins = [ "git" ];
    };
  };
}
