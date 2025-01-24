{
  description = ''
    For questions just DM me on X: https://twitter.com/@longee
    There is also some NIXOS content on my YT channel: https://www.youtube.com/@longee

    One of the best ways to learn NIXOS is to read other peoples configurations. I have personally learned a lot from Gabriel Fontes configs:
    https://github.com/Misterio77/nix-starter-configs
    https://github.com/Misterio77/nix-config

    Please also check out the starter configs mentioned above.
  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      # url = "github:danth/stylix/release-24.05";
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    base16.url = "github:SenchoPens/base16.nix";

    tt-schemes = {
      url = "github:tinted-theming/schemes";
      flake = false;
    };

    base16-zathura = {
      url = "github:haozeke/base16-zathura";
      flake = false;
    };

    base16-vim = {
      url = "github:tinted-theming/base16-vim";
      flake = false;
    };

  };

  outputs = {
    self,
    home-manager,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    packages =
      forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    overlays = import ./overlays {inherit inputs;};
    nixosConfigurations = {
      longee-nix = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/longee-nix
          inputs.stylix.nixosModules.stylix
          base16.nixosModule
          ];
      };
    };
    homeConfigurations = {
      "longee@longee-nix" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home/longee/longee-nix.nix];
      };
    };
  };
}
