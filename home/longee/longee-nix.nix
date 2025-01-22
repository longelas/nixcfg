{ config, ... }: { 
    imports = [ 
        ../common
        ../features/cli/default.nix
        ./home.nix 
    ]; 

    features = {
        cli = {
            fish.enable = true;
        };
    };
}
