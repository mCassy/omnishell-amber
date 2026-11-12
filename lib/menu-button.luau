-- SPDX-License-Identifier: GPL-2.0-only
-- Copyright (C) 2026 OmniNull — https://github.com/OmniNull/OmniWM

-- Amber: Default's menu-button with the symbol drawn through look.barGlyph (pixel icon, bar size)
-- and square corners; compare with default/lib/menu-button.luau when it changes.

local look = require("./look")

local button = {}

function button.render(ctx: Context, props)
    local style = ctx.data.bar.style
    local size = math.max(16, style.height - 4)
    local icon = math.min(24, math.max(14, size - 8))
    local image = if props.symbol then look.barGlyph(ctx, { name = props.symbol, color = "foreground" })
        else ui.icon{ app = props.app, pid = props.pid, w = icon, h = icon, placeholder = "app.dashed" }
    return ui.stack{ w = size, h = size, onClick = props.action, help = props.help,
        radius = look.radius(4), hover = look.hover,
        image }
end

return button
