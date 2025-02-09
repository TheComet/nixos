#!/bin/sh
#nix-build '<nixpkgs/nixos>' \
#    -A vm \
#    -I nixpkgs=channel:nixos-24.05 \
#    -I nixos-config=./configuration.nix
nix build .#nixosConfigurations.thecomet.config.system.build.vm
