-- SPDX-License-Identifier: GPL-2.0-only
-- Copyright (C) 2026 OmniNull — https://github.com/OmniNull/OmniWM

-- Power button: a square cell with a power icon; its popout lists Lock, Sleep, Log Out…, Restart…
-- and Shut Down… (OmniWM `session` commands). Drawn through the style's look hooks.

local look = require("../lib/look")

local HOVER = "focus/0.14"
local WIDTH = 200

local ACTIONS = {
    { command = "session lock", symbol = "lock.fill", label = function() return omniwm.l10n("Lock") end },
    { command = "session sleep", symbol = "moon.fill", label = function() return omniwm.l10n("Sleep") end },
    { command = "session logout", symbol = "rectangle.portrait.and.arrow.right",
        label = function() return omniwm.l10n("Log Out…") end },
    { command = "session restart", symbol = "arrow.clockwise", label = function() return omniwm.l10n("Restart…") end },
    { command = "session shutdown", symbol = "power", label = function() return omniwm.l10n("Shut Down…") end },
}

local function panel(style: BarStyle, props)
    -- set outside the capsule branch too: a root without a radius gets OmniWM's default rounded chrome
    props.radius = look.radius(14)
    if style.transparent and style.backgrounds then
        props.material = "clear"
        props.fill = "background"
        props.border = "border"
        props.borderWidth = 1
    end
    return ui.column(props)
end

function render(ctx: Context)
    -- Same round capsule as Nocturne's system-stats button.
    local style = ctx.data.bar.style
    local size = 32 * style.height / 40
    return ui.stack{ w = size, h = size, radius = look.radius(size / 2 - 1),
        fill = if style.backgrounds then "surface" else nil, border = if style.backgrounds then "border/0.6" else nil,
        borderWidth = 1, hover = "error/0.12", onClick = ui.popout, help = omniwm.l10n("Shut Down…"),
        look.barGlyph(ctx, { name = "power", color = "error" }) }
end

function popout(ctx: Context)
    local rows = { w = WIDTH, gap = 2, pad = 10, center = false }
    for _, action in ACTIONS do
        local shutdown = action.command == "session shutdown"
        rows[#rows + 1] = ui.row{ key = action.command, w = WIDTH - 20, gap = 10, pad = 6, radius = look.radius(8),
            hover = if shutdown then "error/0.12" else HOVER, onClick = action.command,
            look.glyph{ name = action.symbol, w = 14, h = 14,
                color = if shutdown then "error" else "secondaryForeground" },
            look.text{ text = action.label(), color = if shutdown then "error" else nil } }
    end
    return panel(ctx.data.bar.style, rows)
end
