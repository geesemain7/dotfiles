--  _   _                  _                 _   _             
-- | | | |                | |               | | | |            
-- | |_| |_   _ _ __  _ __| | __ _ _ __   __| | | |_   _  __ _ 
-- |  _  | | | | '_ \| '__| |/ _` | '_ \ / _` | | | | | |/ _` |
-- | | | | |_| | |_) | |  | | (_| | | | | (_| |_| | |_| | (_| |
-- \_| |_/\__, | .__/|_|  |_|\__,_|_| |_|\__,_(_)_|\__,_|\__,_|
--         __/ | |
--        |___/|_|                                             

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Laptop display
hl.monitor({
    output   = "DP-1",
    mode     = "2560x1600@239.94",
    vrr      = 1,
    position = "auto",
    scale    = "1.33"
})

-- Odyssey G7
hl.monitor({
    output   = "DP-6",
    mode     = "3480x2160@143.99",
    vrr      = 1,
    position = "auto",
    scale    = "1.5",
})

hl.config({
    xwayland = {
        force_zero_scaling = true
    }
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "kitty"
local fileManager = "nautilus"
local browser     = "firefox"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function () 
  hl.exec_cmd("noctalia")
  hl.exec_cmd("hypr_steam_watcher")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("GDK_SCALE", "1.33")
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Custom")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Bibata-Custom")

-- NVIDIA poo
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-----------------------
----- PERMISSIONS -----
-----------------------

-- empty for now lolo

-----------------------
---- LAYOUT RULES -----
-----------------------

hl.config({
    dwindle = {
        preserve_split = true,
        smart_split    = true,
    }
})

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 10,
  },

  decoration = {
    rounding = 10,
    rounding_power = 2,

    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = 0xee1a1a1a,
    },

    blur = {
      enabled = true,
      size = 3,
      passes = 3,
      vibrancy = 0.1696,
    },
  },
})

-- Layer rules

hl.layer_rule({
  name = "noctalia",

  match = {
    namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
  },

  no_anim = true,
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})

-- Window-specific decoration
hl.window_rule({ match = { class = "io.bassi.Amberol" },   opacity = "0.8 override", })
hl.window_rule({ match = { class = "kitty" },              opacity = "0.8 override", })
hl.window_rule({ match = { class = "org.gnome.Nautilus" }, opacity = "0.8 override", })

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
-- For some reason easy isn't taking the damping argument :p
-- hl.curve("easy", { type = "spring", mass = 1, stiffness = 238.1191, damping = 10 })

hl.animation({ leaf = "global",        enabled = true,  speed = 2,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
-- hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
-- hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "linear", style = "slide" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "linear", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "linear", style = "slide" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })


----------------
----  MISC  ----
----------------

-- I don't want no mascot bro
hl.config({
    misc = {
        disable_hyprland_logo        = true,
        disable_splash_rendering     = true,
        force_default_wallpaper      = 1,
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",

        follow_mouse = 2,
        sensitivity = 1,
        accel_profile = "flat",
        -- force_no_accel = true,

        touchpad = {
            clickfinger_behavior = true,
            natural_scroll = true,
            scroll_factor = 0.5,
            tap_to_click = false,
        },
    },
})


hl.device({
    name = "asuf1209:00-2808:0219-touchpad",
    accel_profile = "custom",
    scroll_points = "0.2144477506 0.000 0.307 0.615 1.077 1.539 2.002 2.505 3.208 3.910 4.613 5.315 6.018 6.720 7.423 8.125 8.828 9.530 10.233 10.935 12.387",
    sensitivity = 0.8,
})
-- Gesture settings
hl.gesture({
    fingers = 4,
    direction = "horizontal",
    action = "workspace"
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"
local ipc = "noctalia msg "

local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- Launchers
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(browser))

-- Noctalia shell commands
hl.bind(mainMod .. " + S",         hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(ipc .. "settings-toggle"))
hl.bind(mainMod .. " + Space",     hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"))

hl.bind("ALT + TAB",               hl.dsp.exec_cmd(ipc .. "window-switcher"))
hl.bind("Print", hl.dsp.exec_cmd(ipc .. "screenshot-region"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd(ipc .. "screenshot-fullscreen"))

-- Window Management
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Move/resize windows with touchpad
hl.bind(mainMod .. " + TAB", hl.dsp.window.drag(),  { mouse = true })
hl.bind(mainMod .. " + ALT_L", hl.dsp.window.resize(), { mouse = true })

-- Function row
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd(ipc .. "volume-up"))
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd(ipc .. "volume-down"))
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd(ipc .. "volume-mute"))
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd(ipc .. "brightness-up"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness-down"))
hl.bind("XF86AudioNext",         hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause",        hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",         hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Noctalia window settings
hl.window_rule({
    match = { class = "dev.noctalia.Noctalia" },
    float = true,
    size = { 1080, 920 },
})

-- Windows that I prefer floating
hl.window_rule({ match = { class = "io.bassi.Amberol" }, float = true, })
hl.window_rule({ match = { class = "qbz" },              float = true, })
hl.window_rule({ match = { class = "steam" },            float = true, })

hl.window_rule({
    match = { title = "Friends List" },
    float = true,
    size = { 400, 800 },
})

-- Kick steam games to workspace 9 by default
hl.window_rule({
    match = {
        class = "steam_app_*"
    },
    fullscreen = true,
    workspace = "9",
})

-- Peristent workspaces for Noctalia
hl.workspace_rule({ workspace = "1", monitor = "DP-6", persistent = true, default_name = "web" })
hl.workspace_rule({ workspace = "2", monitor = "DP-6", persistent = true, default_name = "code" })
hl.workspace_rule({ workspace = "3", monitor = "DP-6", persistent = true, default_name = "chat" })
hl.workspace_rule({ workspace = "5", monitor = "DP-6", persistent = true, default_name = "design" })
hl.workspace_rule({ workspace = "9", monitor = "DP-6", persistent = true, default_name = "game" })

-- For Noctalia Color templates
require("noctalia").apply_theme()
