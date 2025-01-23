{pkgs, ...}: {
    imports = [
        ./hyprland.nix
        ./wayland.nix
        #./stylix.nix
    ];

    home.packages = with pkgs; [
    ];
}