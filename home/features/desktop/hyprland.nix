{
    config,
    lib,
    ...
}:
with lib; let
    cfg = config.features.desktop.hyprland;

in {
    options.features.desktop.hyprland.enable = mkEnableOption "hyprland enable feature";
    
    config = mkIf cfg.enable{

    wayland.windowManager.hyprland = {
        enable = true;

        settings = 
        {
                    monitor = [
                        ",preferred,auto,auto"
                        ",preferred,auto,auto"
                    ];

                    xwayland.force_zero_scaling = true;

                    exec-once = [
                        "waybar"
                        "hyprpaper"
                        "hypridle"
                        "wl-paste -p -t text --watch clipman store -P --histpath=\"~/.local/share/clipman-primary.json\""
                    ];

                    env = [
                        "XCURSOR_SIZE,32"
                        "WLR_NO_HARDWARE_CURSORS,1" 
                        "GTK_THEME,Dracula"
                    ];

                    decoration = {
                        col.shadow = mkDefault "rgb(8ec078c)";
                        rounding = mkDefault 10;
                        blur = {
                            enabled = mkDefault true;
                            size = mkDefault 3;
                            passes = mkDefault 1;
                        };
                        drop_shadow = mkDefault true;
                        shadow_range = mkDefault 4;
                        shadow_render_power = mkDefault 3;
                    };

                    input = {
                        kb_layout = "us,hu";
                        kb_variant = "";
                        kb_model = "";
                        kb_rules = "";
                        kb_options = "ctrl:nocaps";
                        follow_mouse = 1;
                        touchpad = {
                            natural_scroll = true;
                        };
                        sensitivity = 0;
                    };

                    #master.new_status = "master";
                    #master.new_is_master = true;

                    gestures.workspace_swipe = false;

                    windowrule = [
                        "float, file_progress"
                        "float, confirm"
                        "float, dialog"
                        "float, download"
                        "float, notification"
                        "float, error"
                        "float, splash"
                        "float, confirmreset"
                        "float, title:Open File"
                        "float, title:branchdialog"
                        "float, Lxappearance"
                        "float, Wofi"
                        "float, dunst"
                        "animation none,Wofi"
                        "float,viewnior"
                        "float,feh"
                        "float, pavucontrol-qt"
                        "float, pavucontrol"
                        "float, file-roller"
                        "fullscreen, wlogout"
                        "float, title:wlogout"
                        "fullscreen, title:wlogout"
                        "idleinhibit focus, mpv"
                        "idleinhibit fullscreen, firefox"
                        "float, title:^(Media viewer)$"
                        "float, title:^(Volume Control)$"
                        "float, title:^(Picture-in-Picture)$"
                        "size 800 600, title:^(Volume Control)$"
                        "move 75 44%, title:^(Volume Control)$"
                    ];

                    windowrulev2 = [
                        "workspace 1,class:(Emacs)"
                        "workspace 3,opacity 1.0, class:(brave-browser)"
                        "workspace 4,class:(com.obsproject.Studio)"
                    ];

                    workspace = [
                        "1, monitor:DP-1, default:true"
                        "2, monitor:DP-1"
                        "3, monitor:DP-1"
                        "4, monitor:HDMI-A-1"
                        "5, monitor:HDMI-A-1"
                    ];

                    "$mainMod" = "SUPER";

                    bind = [
                        "$mainMod, return, exec, kitty -e zellij"
                        "$mainMod, t, exec, kitty -e fish -c 'neofetch; exec fish'"
                        "$mainMod SHIFT, e, exec, kitty -e zellij_nvim"
                        "$mainMod, o, exec, thunar"
                        "$mainMod, Escape, exec, wlogout -p layer-shell"
                        "$mainMod, Space, togglefloating"
                        "$mainMod, q, killactive"
                        "$mainMod, M, exit"
                        "$mainMod, F, fullscreen"
                        "$mainMod, V, togglefloating"
                        "$mainMod, D, exec, wofi --show drun --allow-images"
                        "$mainMod SHIFT, S, exec, bemoji"
                        "$mainMod, P, exec, wofi-pass"
                        "$mainMod SHIFT, P, pseudo"
                        "$mainMod, J, togglesplit"
                        "$mainMod, left, movefocus, l"
                        "$mainMod, right, movefocus, r"
                        "$mainMod, up, movefocus, u"
                        "$mainMod, down, movefocus, d"
                        "$mainMod, 1, workspace, 1"
                        "$mainMod, 2, workspace, 2"
                        "$mainMod, 3, workspace, 3"
                        "$mainMod, 4, workspace, 4"
                        "$mainMod, 5, workspace, 5"
                        "$mainMod, 6, workspace, 6"
                        "$mainMod, 7, workspace, 7"
                        "$mainMod, 8, workspace, 8"
                        "$mainMod, 9, workspace, 9"
                        "$mainMod, 0, workspace, 10"
                        "$mainMod SHIFT, 1, movetoworkspace, 1"
                        "$mainMod SHIFT, 2, movetoworkspace, 2"
                        "$mainMod SHIFT, 3, movetoworkspace, 3"
                        "$mainMod SHIFT, 4, movetoworkspace, 4"
                        "$mainMod SHIFT, 5, movetoworkspace, 5"
                        "$mainMod SHIFT, 6, movetoworkspace, 6"
                        "$mainMod SHIFT, 7, movetoworkspace, 7"
                        "$mainMod SHIFT, 8, movetoworkspace, 8"
                        "$mainMod SHIFT, 9, movetoworkspace, 9"
                        "$mainMod SHIFT, 0, movetoworkspace, 10"
                        "$mainMod, mouse_down, workspace, e+1"
                        "$mainMod, mouse_up, workspace, e-1"
                    ];

                    bindm = [
                        "$mainMod, mouse:272, movewindow"
                        "$mainMod, mouse:273, resizewindow"
                    ];
                };
            };
    };
}