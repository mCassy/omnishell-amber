-- SPDX-License-Identifier: GPL-2.0-only
-- Amber: Default's skin with square corners, Departure Mono and Pixelarticons.

local FONT = "Departure Mono"
local ICON_FONT = "pixelart-icons-font"

-- SF Symbol name → Pixelarticons codepoint; unmapped names fall back to the SF Symbol.
local ICONS = {
    ["antenna.radiowaves.left.and.right"] = "\u{ECEB}", -- radio
    ["app.dashed"] = "\u{ED6C}", -- square
    ["app.fill"] = "\u{EA52}", -- app-mac
    ["applelogo"] = "\u{EA55}", -- apple-solid
    ["arrow.down"] = "\u{EA6D}", -- arrow-down
    ["arrow.up"] = "\u{EA7A}", -- arrow-up
    ["arrow.triangle.2.circlepath"] = "\u{ECF8}", -- refresh
    ["arrow.up.arrow.down"] = "\u{ED4B}", -- sort-vertical
    ["arrow.up.forward.app"] = "\u{EB8E}", -- external-link
    ["backward.fill"] = "\u{EB13}", -- chevron-left-2
    ["forward.fill"] = "\u{EB15}", -- chevron-right-2
    ["battery.0percent"] = "\u{EAAC}", -- battery
    ["battery.25percent"] = "\u{EAA8}", -- battery-low
    ["battery.50percent"] = "\u{EAAA}", -- battery-medium
    ["battery.75percent"] = "\u{EAAA}", -- battery-medium
    ["battery.100percent"] = "\u{EAA6}", -- battery-full
    ["battery.100percent.bolt"] = "\u{EE0A}", -- zap
    ["beats.headphones"] = "\u{EBE6}", -- headphone
    ["headphones"] = "\u{EBE6}", -- headphone
    ["airpods"] = "\u{EBE6}", -- headphone
    ["airpodspro"] = "\u{EBE6}", -- headphone
    ["airpodsmax"] = "\u{EBE6}", -- headphone
    ["tv"] = "\u{EDC7}", -- tv
    ["airplayaudio"] = "\u{EA12}", -- airplay
    ["bell"] = "\u{EAB4}", -- bell
    ["bell.badge"] = "\u{EAB2}", -- bell-ring
    ["bolt.fill"] = "\u{EE0A}", -- zap
    ["bolt.horizontal"] = "\u{EE0A}", -- zap
    ["cable.connector"] = "\u{ECD5}", -- plug
    ["calendar"] = "\u{EAED}", -- calendar
    ["calendar.badge.plus"] = "\u{EAE5}", -- calendar-2
    ["cellularbars"] = "\u{EB00}", -- cellular-signal-3
    ["checkmark"] = "\u{EB0A}", -- check
    ["checkmark.circle.fill"] = "\u{EB0A}", -- check
    ["chevron.left"] = "\u{EB14}", -- chevron-left
    ["chevron.right"] = "\u{EB16}", -- chevron-right
    ["circle.fill"] = "\u{EB26}", -- circle
    ["cloud.sun.fill"] = "\u{EB33}", -- cloud-sun
    ["cpu"] = "\u{EB5B}", -- cpu
    ["cube"] = "\u{EAC1}", -- box
    ["desktopcomputer"] = "\u{ECA0}", -- monitor
    ["doc.fill"] = "\u{EB9A}", -- file
    ["dot.radiowaves.left.and.right"] = "\u{ECEB}", -- radio
    ["ellipsis.circle"] = "\u{ECA3}", -- more-horizontal
    ["exclamationmark.triangle"] = "\u{EDF6}", -- warning-diamond
    ["eye.slash"] = "\u{EB8F}", -- eye-off
    ["eye.slash.fill"] = "\u{EB8F}", -- eye-off
    ["gauge.with.needle"] = "\u{ED4F}", -- speed-medium
    ["gearshape"] = "\u{EBB7}", -- gear
    ["globe"] = "\u{EBC6}", -- globe
    ["hifispeaker.fill"] = "\u{EDEE}", -- volume
    ["internaldrive"] = "\u{EB69}", -- database
    ["keyboard"] = "\u{EC15}", -- keyboard
    ["location.fill"] = "\u{EBD0}", -- gps
    ["lock"] = "\u{EC6C}", -- lock
    ["lock.fill"] = "\u{EC6C}", -- lock
    ["magnifyingglass"] = "\u{ED18}", -- search
    ["memorychip"] = "\u{EC87}", -- memory-stick
    ["mic.fill"] = "\u{EC97}", -- mic
    ["moon.fill"] = "\u{ECA1}", -- moon
    ["music.note"] = "\u{ECAD}", -- music
    ["network"] = "\u{EC9C}", -- modem
    ["pause.fill"] = "\u{ECC0}", -- pause
    ["play.fill"] = "\u{ECD3}", -- play
    ["pin.fill"] = "\u{EC7B}", -- map-pin
    ["power"] = "\u{ECE0}", -- power
    ["rectangle.portrait.and.arrow.right"] = "\u{EC70}", -- logout
    ["arrow.clockwise"] = "\u{ECFA}", -- reload
    ["rectangle.3.group"] = "\u{EC25}", -- layout
    ["rectangle.on.rectangle"] = "\u{EB49}", -- copy
    ["rectangle.split.2x2"] = "\u{EBD4}", -- grid-2x2-2
    ["rectangle.split.3x1"] = "\u{EBD8}", -- grid-3x2
    ["repeat.1"] = "\u{ECFC}", -- repeat-1
    ["sparkles"] = "\u{ED4D}", -- sparkles
    ["speaker.fill"] = "\u{EDEE}", -- volume
    ["speaker.slash"] = "\u{EDED}", -- volume-x
    ["speaker.slash.fill"] = "\u{EDED}", -- volume-x
    ["speaker.wave.1.fill"] = "\u{EDE9}", -- volume-1
    ["speaker.wave.2"] = "\u{EDEA}", -- volume-2
    ["speaker.wave.2.fill"] = "\u{EDEA}", -- volume-2
    ["speaker.wave.3.fill"] = "\u{EDEB}", -- volume-3
    ["square.grid.2x2"] = "\u{EBD4}", -- grid-2x2-2
    ["sun.max.fill"] = "\u{ED7D}", -- sun
    ["switch.2"] = "\u{ED3D}", -- sliders
    ["thermometer.medium"] = "\u{EDAE}", -- thermometer
    ["tray.fill"] = "\u{EBFF}", -- inbox
    ["video.fill"] = "\u{EDE8}", -- video
    ["wifi"] = "\u{EE01}", -- wifi
    ["wifi.slash"] = "\u{EAF0}", -- cancel
    ["xmark"] = "\u{EB30}", -- close
    ["xmark.circle.fill"] = "\u{EB30}", -- close
}

-- Default output transport → bar icon: Bluetooth (AirPods and the like) → headphones, USB (headsets) → mic.
local OUTPUT_ICONS = { bluetooth = "headphones", usb = "mic.fill" }

-- Pixel fonts stay crisp only at multiples of their grid (Departure Mono 11 pt; Pixelarticons 24 px = 6 pt steps on Retina).
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
        props.size = snap(props.size or 14, 6)
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
    -- one pixel wifi icon instead of Default's vector fan; signal level isn't shown
    wifiBar = function(ctx, state)
        local name = if state.wired then "network" elseif state.power and state.connected then "wifi" else "wifi.slash"
        return look.bar(ctx, { look.barGlyph(ctx, { name = name }) })
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
        local props = { look.barGlyph(ctx, { name = name }) }
        if m.volume then
            props[2] = look.text{ text = m.percent }
        end
        return look.bar(ctx, props)
    end,
})

return look
