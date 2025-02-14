{
  description = "TheComet NixOS";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    #thecomet-nvim = { url = "github:TheComet/nvim"; flake = false; };
  };
  outputs = { self, nixpkgs, home-manager }: {
    nixosConfigurations.thecomet = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            #extraSpecialArgs = {
            #  thecomet-nvim = thecomet-nvim;
            #};
            users.thecomet = import ./home.nix;
          };
        }
      ];
    };
  };
}
