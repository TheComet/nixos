{
  description = "TheComet NixOS";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    #thecomet-nvim = { url = "github:TheComet/nvim"; flake = false; };
  };
  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager }:
  let
    system = "x86_64-linux";
    pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
  in {
    nixosConfigurations.thecomet = nixpkgs.lib.nixosSystem {
      system = system;
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {
            #  thecomet-nvim = thecomet-nvim;
              inherit pkgs-unstable;
            };
            users.thecomet = import ./home.nix;
          };
        }
      ];
    };
  };
}
