# Amber

An amber terminal-screen bar for OmniWM: square cells, a pixel font and pixel icons on charcoal.

## Install

In OmniWM, open **Settings > Styles & Widgets > Get Styles > Add from GitHub**, paste this
repository's address, and install **Amber**. Then pick it as your style.

## What it changes

Everything is OmniWM's Default skin, reshaped through its `look` hooks:

- **Square everything.** Every corner radius is zero: bar cells, workspace cells, panels, popouts.
- **Pixel type.** Text is set in Departure Mono, snapped to its 11 pt grid, with a faint
  phosphor glow. Icons come from Pixelarticons, mapped from the SF Symbol names the stock
  widgets ask for; anything without a pixel match falls back to its SF Symbol.
- **One fixed palette.** Amber text and a hot amber accent on charcoal, the same in light and
  dark mode.
- **Workspaces as terminal cells.** Numbered square cells; the focused one gets an amber outline.
- **Bar tweaks.** One pixel Wi-Fi icon instead of the signal fan; the battery always shows its
  level (no charging bolt); the volume icon follows the default output: headphones for
  Bluetooth, a mic for USB headsets, the speaker otherwise.
- **Power button.** A `power` widget at the right edge with Lock, Sleep, Log Out, Restart and
  Shut Down.

The bar is 38 pt tall and sits in the menu bar row. The notch island inherits Default's; to
hide it, turn the island off in OmniWM's settings.

## Known limits

- App icons in the workspaces stay in full colour.
- A few stock widgets hard-code a rounded shape (notification badges, the Bluetooth
  connection dot) and stay round.
- Pixelarticons has no Bluetooth icon, so Bluetooth keeps Default's drawn symbol.

## Credits and licences

Style code is GPL-2.0-only (see [LICENSE](LICENSE)); it builds on OmniWM's Default skin by
OmniNull, and `lib/menu-button.luau` is adapted from Default's. Fonts ship with their notices
in `fonts/`: Departure Mono by Helena Zhang (SIL Open Font License 1.1) and Pixelarticons by
Gerrit Halfmann (MIT).
