{ config, ... }: { 
    imports = [ 
        ../common
        ./home.nix 
        ../features/cli/default.nix
    ]; 
}
