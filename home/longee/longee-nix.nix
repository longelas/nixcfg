{ 
    imports = [ 
        ../common
        ../features/cli/default.nix
        ../features/desktop/default.nix
        ./home.nix 
    ]; 

    features = {
        cli = {
            fish.enable = true;
            fzf.enable = true;
            neofetch.enable = true;
        };
        
        desktop = {
            wayland.enable = true;
            hyprland.enable = true;
        };
    };

}
