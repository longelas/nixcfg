{ config, ... }: { 
    imports = [ 
        ../common
        ./home.nix 
        ../features/cli/default.nix
    ]; 

    features = {
        cli = {
            fish.enable = true;
        };
    };
}
