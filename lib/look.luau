-- SPDX-License-Identifier: GPL-2.0-only
-- Amber: Default's skin with square corners, Departure Mono and Material Symbols Sharp icons.

local FONT = "Departure Mono"
local ICON_FONT = "Material Symbols Sharp"

-- SF Symbol name → Material Symbols Sharp codepoint; unmapped names (applelogo) fall back to the SF Symbol.
local ICONS = {
    ["antenna.radiowaves.left.and.right"] = "\u{E51E}", -- sensors
    ["app.dashed"] = "\u{E835}", -- check_box_outline_blank
    ["app.fill"] = "\u{E069}", -- web_asset
    ["arrow.down"] = "\u{E5DB}", -- arrow_downward
    ["arrow.up"] = "\u{E5D8}", -- arrow_upward
    ["arrow.triangle.2.circlepath"] = "\u{E627}", -- sync
    ["arrow.up.arrow.down"] = "\u{E8D5}", -- swap_vert
    ["arrow.up.forward.app"] = "\u{E89E}", -- open_in_new
    ["backward.fill"] = "\u{E045}", -- skip_previous
    ["forward.fill"] = "\u{E044}", -- skip_next
    ["battery.0percent"] = "\u{F8AE}", -- battery_horiz_000
    ["battery.25percent"] = "\u{F8AE}", -- battery_horiz_000
    ["battery.50percent"] = "\u{F8AF}", -- battery_horiz_050
    ["battery.75percent"] = "\u{F8B0}", -- battery_horiz_075
    ["battery.100percent"] = "\u{F13B}", -- battery_full_alt
    ["battery.100percent.bolt"] = "\u{E1A3}", -- battery_charging_full
    ["beats.headphones"] = "\u{F01F}", -- headphones
    ["headphones"] = "\u{F01F}", -- headphones
    ["airpods"] = "\u{F01F}", -- headphones
    ["airpodspro"] = "\u{F01F}", -- headphones
    ["airpodsmax"] = "\u{F01F}", -- headphones
    ["tv"] = "\u{E63B}", -- tv
    ["airplayaudio"] = "\u{E055}", -- airplay
    ["bell"] = "\u{E7F5}", -- notifications
    ["bell.badge"] = "\u{F4FE}", -- notifications_unread
    ["bolt.fill"] = "\u{EA0B}", -- bolt
    ["bolt.horizontal"] = "\u{EA0B}", -- bolt
    ["cable.connector"] = "\u{EFE6}", -- cable
    ["calendar"] = "\u{E935}", -- calendar_today
    ["calendar.badge.plus"] = "\u{EF85}", -- calendar_add_on
    ["cellularbars"] = "\u{E202}", -- signal_cellular_alt
    ["checkmark"] = "\u{E668}", -- check
    ["checkmark.circle.fill"] = "\u{F0BE}", -- check_circle
    ["chevron.left"] = "\u{E5CB}", -- chevron_left
    ["chevron.right"] = "\u{E5CC}", -- chevron_right
    ["circle.fill"] = "\u{EF4A}", -- circle
    ["cloud.sun.fill"] = "\u{F172}", -- partly_cloudy_day
    ["cpu"] = "\u{E322}", -- memory
    ["cube"] = "\u{F720}", -- deployed_code
    ["desktopcomputer"] = "\u{E30C}", -- desktop_windows
    ["doc.fill"] = "\u{E873}", -- description
    ["dot.radiowaves.left.and.right"] = "\u{E51E}", -- sensors
    ["ellipsis.circle"] = "\u{E5D3}", -- more_horiz
    ["exclamationmark.triangle"] = "\u{F083}", -- warning
    ["eye.slash"] = "\u{E8F5}", -- visibility_off
    ["eye.slash.fill"] = "\u{E8F5}", -- visibility_off
    ["gauge.with.needle"] = "\u{E9E4}", -- speed
    ["gearshape"] = "\u{E8B8}", -- settings
    ["globe"] = "\u{EA07}", -- language
    ["hifispeaker.fill"] = "\u{E32D}", -- speaker
    ["internaldrive"] = "\u{F80E}", -- hard_drive
    ["keyboard"] = "\u{E312}", -- keyboard
    ["location.fill"] = "\u{F1DB}", -- location_on
    ["lock"] = "\u{E899}", -- lock
    ["lock.fill"] = "\u{E899}", -- lock
    ["magnifyingglass"] = "\u{EF7A}", -- search
    ["memorychip"] = "\u{F7A3}", -- memory_alt
    ["mic.fill"] = "\u{E31D}", -- mic
    ["moon.fill"] = "\u{E51C}", -- dark_mode
    ["music.note"] = "\u{E405}", -- music_note
    ["network"] = "\u{EB2F}", -- lan
    ["pause.fill"] = "\u{E034}", -- pause
    ["play.fill"] = "\u{E037}", -- play_arrow
    ["pin.fill"] = "\u{F10D}", -- push_pin
    ["power"] = "\u{F8C7}", -- power_settings_new
    ["rectangle.portrait.and.arrow.right"] = "\u{E9BA}", -- logout
    ["arrow.clockwise"] = "\u{E5D5}", -- refresh
    ["rectangle.3.group"] = "\u{E8F1}", -- view_quilt
    ["rectangle.on.rectangle"] = "\u{E3E0}", -- filter_none
    ["rectangle.split.2x2"] = "\u{E9B0}", -- grid_view
    ["rectangle.split.3x1"] = "\u{E8F3}", -- view_week
    ["repeat.1"] = "\u{E041}", -- repeat_one
    ["sparkles"] = "\u{E65F}", -- auto_awesome
    ["speaker.fill"] = "\u{E04E}", -- volume_mute
    ["speaker.slash"] = "\u{E04F}", -- volume_off
    ["speaker.slash.fill"] = "\u{E04F}", -- volume_off
    ["speaker.wave.1.fill"] = "\u{E04D}", -- volume_down
    ["speaker.wave.2"] = "\u{E050}", -- volume_up
    ["speaker.wave.2.fill"] = "\u{E050}", -- volume_up
    ["speaker.wave.3.fill"] = "\u{E050}", -- volume_up
    ["square.grid.2x2"] = "\u{E5C3}", -- apps
    ["sun.max.fill"] = "\u{E518}", -- light_mode
    ["switch.2"] = "\u{E429}", -- tune
    ["thermometer.medium"] = "\u{F076}", -- thermostat
    ["tray.fill"] = "\u{E156}", -- inbox
    ["video.fill"] = "\u{E04B}", -- videocam
    ["wifi"] = "\u{E63E}", -- wifi
    ["wifi.slash"] = "\u{E648}", -- wifi_off
    ["xmark"] = "\u{E5CD}", -- close
    ["xmark.circle.fill"] = "\u{E888}", -- cancel
}

-- Default output transport → bar icon: Bluetooth (AirPods and the like) → headphones, USB (headsets) → mic.
local OUTPUT_ICONS = { bluetooth = "headphones", usb = "mic.fill" }

-- Pixel fonts stay crisp only at multiples of their grid (Departure Mono 11 pt).
local function snap(size, grid)
    return math.max(grid, math.floor(size / grid + 0.25) * grid)
end

-- A popout root with radius 0 gets OmniWM's default rounded chrome, so "square" is a hair above 0.
local SQUARE = 0.01

local look
look = require("./skin")({
    hover = "accent/0.15",
    size = { symbol = 18, barSymbol = 18 },
    radius = function()
        return SQUARE
    end,
    text = function(props)
        if props.color == nil and props.role == "secondary" then
            props.color = "secondaryForeground"
        end
        props.role = nil
        props.style = nil
        props.weight = nil
        -- monospace digits never jitter, and widths like "00:00 PM" leave a gap after a 24-hour time
        props.reserve = nil
        props.font = FONT
        props.size = snap(props.size or 13, 11)
        if props.color ~= "accentForeground" then
            props.shadow = props.shadow or "foreground/0.35"
            props.shadowRadius = props.shadowRadius or 3
        end
        return ui.text(props)
    end,
    glyph = function(props)
        local char = ICONS[props.name]
        if char == nil then
            return ui.symbol(props)
        end
        props.name = nil
        props.weight = nil
        props.text = char
        props.font = ICON_FONT
        props.size = props.size or 14
        return ui.text(props)
    end,
    panel = function(_, props)
        props.pad = props.pad or 14
        props.gap = props.gap or 12
        props.radius = SQUARE
        props.material = "clear"
        props.fill = "background"
        props.border = "accent"
        props.borderWidth = 2
        props.shadow = "accent/0.25"
        props.shadowRadius = 10
        props.center = false
        return ui.column(props)
    end,
    group = function(props)
        props.pad = props.pad or 12
        props.gap = props.gap or 8
        props.radius = SQUARE
        props.fill = props.fill or "surface"
        props.border = props.border or "border"
        props.borderWidth = 1
        props.center = false
        return ui.column(props)
    end,
    workspacePill = function(pill, workspace, _, _, occupied)
        pill.fill = if workspace.focused then "accent/0.12" else nil
        pill.border = if workspace.focused then "accent" elseif occupied then "border" else nil
        pill.borderWidth = 1
    end,
    -- solid zap looks heavier than the outlined icons, so charging keeps the level icon
    batterySymbol = function(level)
        return if level > 85 then "battery.100percent"
            elseif level > 35 then "battery.50percent"
            elseif level > 10 then "battery.25percent"
            else "battery.0percent"
    end,
    -- one wifi icon instead of Default's vector fan; signal level isn't shown
    wifiBar = function(ctx, state)
        local name = if state.wired then "network" elseif state.power and state.connected then "wifi" else "wifi.slash"
        return look.bar(ctx, { hover = look.hover, look.barGlyph(ctx, { name = name }) })
    end,
    -- Default's volume picks its icon by device kind, which USB headsets don't report; go by transport
    volumeBar = function(ctx, m)
        local transport
        for _, device in ctx.data.outputs or {} do
            if device.default then
                transport = device.transport
            end
        end
        local name = if m.muted then "speaker.slash.fill" else OUTPUT_ICONS[transport] or m.symbol
        local props = { hover = look.hover, look.barGlyph(ctx, { name = name }) }
        if m.volume then
            props[2] = look.text{ text = m.percent }
        end
        return look.bar(ctx, props)
    end,
})

return look
