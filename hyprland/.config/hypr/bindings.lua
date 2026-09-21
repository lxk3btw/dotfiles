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

-- -----------------------------------------------------------------------------
-- 2. APPLICATION & SCRIPT BINDINGS (o.bind)
-- -----------------------------------------------------------------------------
-- Terminal & Files
o.bind("SUPER + SHIFT + S", "Toggle layout (Scrolling/Normal)", "omarchy-hyprland-workspace-layout-toggle")
o.bind("SUPER + SHIFT + K", "Show keybindings", "omarchy-menu-keybindings")
o.bind("SUPER + RETURN", "Terminal", 'uwsm-app -- xdg-terminal-exec --dir="$(omarchy-cmd-terminal-cwd)"')
o.bind("SUPER + SHIFT + F", "File manager", "uwsm-app -- nautilus --new-window")
o.bind("SUPER + ALT + SHIFT + F", "File manager (cwd)", 'uwsm-app -- nautilus --new-window "$(omarchy-cmd-terminal-cwd)"')

-- Apps & Webapps
o.bind("SUPER + B", "Browser", "omarchy-launch-browser")
o.bind("SUPER + SHIFT + B", "Browser (private)", "omarchy-launch-browser --private")
o.bind("SUPER + N", "Editor", "omarchy-launch-editor")
o.bind("SUPER + SHIFT + D", "Docker", "omarchy-launch-tui lazydocker")
o.bind("SUPER + O", "Obsidian", 'omarchy-launch-or-focus ^obsidian$ "uwsm-app -- obsidian -disable-gpu --enable-wayland-ime"')
o.bind("SUPER + Y", "YouTube", 'omarchy-launch-webapp "https://youtube.com/"')
o.bind("SUPER + SHIFT + ALT + G", "WhatsApp", 'omarchy-launch-or-focus-webapp WhatsApp "https://web.whatsapp.com/"')

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




