{
  description = "nixos flake";
  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };
  
  outputs = { self, nixpkgs, ... }: 
    let
      lib = nixpkgs.lib;
    in {
    nixosConfigurations = {
      main-pc = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./system/main-pc/configuration.nix
        ];
      };
    };
  };
}
