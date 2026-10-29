local function closeAllWindows()
    local windows = hl.get_windows()

    for _,w in pairs(windows) do
        hl.dispatch(hl.dsp.window.close({ window = w }))
    end
end

local function closeAllWindowsCurrentWorkspace()
    local cws = hl.get_active_workspace()
    local windows = hl.get_windows({ workspace = cws })

    for _,w in pairs(windows) do
        hl.dispatch(hl.dsp.window.close({ window = w }))
    end
end

hl.bind("SUPER+BackSpace", closeAllWindowsCurrentWorkspace )
hl.bind("SUPER+Delete", closeAllWindows )
