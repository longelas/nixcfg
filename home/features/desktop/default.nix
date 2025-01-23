{pkgs, ...}: {
    imports = [
        ./hyprland.nix
        ./wayland.nix
        ./stylix.nix
    ];

    home.packages = with pkgs; [
        dejavu_fonts
        jetbrains-mono
        noto-fonts
        noto-fonts-lgc-plus
        texlivePackages.hebrew-fonts
        noto-fonts-emoji
        font-awesome
        powerline-fonts
        powerline-symbols
        (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];
}