{pkgs, ...}: {
    imports = [
        ./hyprland.nix
        ./wayland.nix
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
        pkgs.nerd-fonts._0xproto
        pkgs.nerd-fonts.droid-sans-mono
    ];
}