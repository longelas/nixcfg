{
    config,
    lib,
    pkgs,
    ...
}:
with lib; let
    cfg = config.features.desktop.wayland;
in{
    options.features.desktop.wayland.enable = mkEnableOption "wayland extra tools and congfiguration";

    config = mkIf cfg.enable {
        programs.waybar = {
            enable = true;
            style = ./waybar.css;
            settings = {
            mainBar = {
                layer = "top";
                position = "top";
                height = 30;
                modules-left = ["hyprland/workspaces"];
                modules-center = ["hyprland/window"];
                modules-right = ["hyprland/language" "custom/weather" "pulseaudio" "battery" "clock" "tray"];
                "hyprland/workspaces" = {
                disable-scroll = true;
                show-special = true;
                special-visible-only = true;
                all-outputs = false;
                format = "{icon}";
                format-icons = {
                    "1" = "";
                    "2" = "";
                    "3" = "";
                    "4" = "";
                    "5" = "";
                    "6" = "";
                    "7" = "";
                    "8" = "";
                    "9" = "";
                    "magic" = "";
                };

                persistent-workspaces = {
                    "*" = 9;
                };
                };

                "hyprland/language" = {
                format-en = "🇺🇸";
                format-hu = "🇭🇺";
                min-length = 5;
                tooltip = false;
                };

                "custom/weather" = {
                format = " {} ";
                exec = "curl -s 'wttr.in/Szigethalom?format=%c%t'";
                interval = 300;
                class = "weather";
                };

                "pulseaudio" = {
                format = "{icon} {volume}%";
                format-bluetooth = "{icon} {volume}% ";
                format-muted = "";
                format-icons = {
                    "headphones" = "";
                    "handsfree" = "";
                    "headset" = "";
                    "phone" = "";
                    "portable" = "";
                    "car" = "";
                    "default" = ["" ""];
                };
                on-click = "pavucontrol";
                };

                "battery" = {
                states = {
                    warning = 30;
                    critical = 1;
                };
                format = "{icon} {capacity}%";
                format-charging = " {capacity}%";
                format-alt = "{time} {icon}";
                format-icons = ["" "" "" "" ""];
                };

                "clock" = {
                format = "{:%d.%m.%Y - %H:%M}";
                format-alt = "{:%A, %B %d at %R}";
                };

                "tray" = {
                icon-size = 14;
                spacing = 1;
                };
            };
            };
    };

        home.packages = with pkgs; [
            grim
            hyprlock
            qt6.qtwayland
            slurp
            waypipe
            wf-recorder
            wl-mirror
            wl-clipboard
            wlogout
            wtype
            ydotool
        ];
    };
}