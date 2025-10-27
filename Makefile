system:
	sudo nixos-rebuild switch --flake /etc/nixos#mousefeet

home:
	home-manager switch --flake /etc/nixos#thecomet@mousefeet
