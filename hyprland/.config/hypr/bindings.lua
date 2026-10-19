-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- -----------------------------------------------------------------------------
-- 1. UNBIND DEFAULTS TO PREVENT CONFLICTS
-- -----------------------------------------------------------------------------
hl.unbind("SUPER + CTRL + K")
hl.unbind("SUPER + SHIFT + K")
hl.unbind("SUPER + SHIFT + F")
hl.unbind("SUPER + RETURN")
hl.unbind("SUPER + H")
hl.unbind("SUPER + J")
hl.unbind("SUPER + K")
hl.unbind("SUPER + L")
hl.unbind("SUPER + S")
hl.unbind("SUPER + O")
hl.unbind("SUPER + LEFT")
hl.unbind("SUPER + RIGHT")
hl.unbind("SUPER + SHIFT + LEFT")
hl.unbind("SUPER + SHIFT + RIGHT")
hl.unbind("SUPER + SHIFT + S")
hl.unbind("SUPER + CTRL + L")
hl.unbind("SUPER + CTRL + H")
hl.unbind("SUPER + code:19")

-- Unbind new workspace keys to prevent overlapping with system defaults
hl.unbind("SUPER + M")
hl.unbind("SUPER + SHIFT + M")
hl.unbind("SUPER + G")
hl.unbind("SUPER + SHIFT + G")
hl.unbind("SUPER + U")
hl.unbind("SUPER + SHIFT + U")
hl.unbind("SUPER + I")
hl.unbind("SUPER + SHIFT + I")
hl.unbind("SUPER + Y")
hl.unbind("SUPER + SHIFT + Y")
hl.unbind("SUPER + E")
hl.unbind("SUPER + SHIFT + E")
hl.unbind("SUPER + Q")
hl.unbind("SUPER + SHIFT + Q")

-- -----------------------------------------------------------------------------
-- 2. APPLICATION & SCRIPT BINDINGS (o.bind)
-- -----------------------------------------------------------------------------
-- Terminal & Files
o.bind("SUPER + SHIFT + S", "Toggle layout (Scrolling/Normal)", "omarchy-hyprland-workspace-layout-toggle")
o.bind("SUPER + SHIFT + K", "Show keybindings", "omarchy-menu-keybindings")
o.bind("SUPER + RETURN", "Terminal", [[uwsm-app -- xdg-terminal-exec --dir="$(omarchy-cmd-terminal-cwd)"]])
o.bind("SUPER + SHIFT + F", "File manager", "uwsm-app -- nautilus --new-window")
o.bind("SUPER + ALT + SHIFT + F", "File manager (cwd)", [[uwsm-app -- nautilus --new-window "$(omarchy-cmd-terminal-cwd)"]])

-- Apps & Webapps
o.bind("SUPER + B", "Browser", "omarchy-launch-browser")
o.bind("SUPER + SHIFT + B", "Browser (private)", "omarchy-launch-browser --private")
o.bind("SUPER + N", "Editor", "omarchy-launch-editor")
o.bind("SUPER + O", "Obsidian", [[omarchy-launch-or-focus ^obsidian$ "uwsm-app -- obsidian -disable-gpu --enable-wayland-ime"]])

-- Launchers & System Utilities
hl.bind("SUPER + S", hl.dsp.layout("togglesplit"))
hl.bind("SUPER + SHIFT + L", hl.dsp.exec_cmd("omarchy-lock-screen"), { description = "Lock system" })
hl.bind("SUPER + P", function()
    hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
    hl.dispatch(hl.dsp.window.pin())
    hl.dispatch(hl.dsp.window.resize({ x = 200, y = 200 }))
    hl.dispatch(hl.dsp.window.bring_to_top())
end)

-- -----------------------------------------------------------------------------
-- 3. HYPRLAND DISPATCHERS (Focus, Window Swap & Layout)
-- Usando la API Lua nativa de Hyprland (`hl.bind` + `hl.dsp`)
-- -----------------------------------------------------------------------------
-- Mover foco de ventana (hjkl)
hl.bind("SUPER + H", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "d" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "r" }))

-- Intercambiar posición de ventanas
hl.bind("SUPER + CTRL + H", hl.dsp.window.swap({ direction = "l" }))
hl.bind("SUPER + CTRL + J", hl.dsp.window.swap({ direction = "d" }))
hl.bind("SUPER + CTRL + K", hl.dsp.window.swap({ direction = "u" }))
hl.bind("SUPER + CTRL + L", hl.dsp.window.swap({ direction = "r" }))

-- Mover el workspace ACTIVO actual al siguiente monitor (+1)
hl.bind("SUPER + SHIFT + CTRL + l", hl.dsp.workspace.move({ monitor = "+1" }))

-- -----------------------------------------------------------------------------
-- 4. CUSTOM LETTER WORKSPACES
-- -----------------------------------------------------------------------------
-- Switch to custom named workspaces
hl.bind("SUPER + M", hl.dsp.focus({ workspace = "name:M" }))
hl.bind("SUPER + G", hl.dsp.focus({ workspace = "name:G" }))
hl.bind("SUPER + U", hl.dsp.focus({ workspace = "name:U" }))
hl.bind("SUPER + I", hl.dsp.focus({ workspace = "name:I" }))
hl.bind("SUPER + Y", hl.dsp.focus({ workspace = "name:Y" }))
hl.bind("SUPER + E", hl.dsp.focus({ workspace = "name:E" }))
hl.bind("SUPER + Q", hl.dsp.focus({ workspace = "name:Q" }))

-- Move active window to custom named workspaces
hl.bind("SUPER + SHIFT + M", hl.dsp.window.move({ workspace = "name:M" }))
hl.bind("SUPER + SHIFT + G", hl.dsp.window.move({ workspace = "name:G" }))
hl.bind("SUPER + SHIFT + U", hl.dsp.window.move({ workspace = "name:U" }))
hl.bind("SUPER + SHIFT + I", hl.dsp.window.move({ workspace = "name:I" }))
hl.bind("SUPER + SHIFT + Y", hl.dsp.window.move({ workspace = "name:Y" }))
hl.bind("SUPER + SHIFT + E", hl.dsp.window.move({ workspace = "name:E" }))
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.move({ workspace = "name:Q" }))
