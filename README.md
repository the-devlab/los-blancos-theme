# Los Blancos

A crisp dark navy theme for VS Code in white, gold, blue and red. Made by The DevLab.

<!-- TODO: add a screenshot: ![Los Blancos screenshot](images/screenshot.png) -->

## Install

1. Open the Extensions view (`Ctrl+Shift+X` / `Cmd+Shift+X`).
2. Search for **Los Blancos** and click **Install**.
3. Open the Command Palette, run **Preferences: Color Theme** and pick a variant.

## Variants

| Theme | Style |
|---|---|
| **Los Blancos** | Dark navy, with a blue status bar and gold highlights. |
| **Los Blancos Away** | Light: white background, blue accents and a blue status bar. |
| **Los Blancos Third** | Blackout: near-black throughout, with a dark blue status bar. |

## Palette (Los Blancos)

| Role | Colour |
|---|---|
| Background (navy) | `#0B1B33` |
| Sidebar & panels | `#081428` |
| Text | `#E8EDF5` |
| White (types, classes) | `#FFFFFF` |
| Blue (status bar, buttons) | `#004996` |
| Light blue (keywords, tags) | `#6FA8F0` |
| Gold (functions, cursor, accents) | `#FCBF00` |
| Soft gold (strings) | `#F5DC9A` |
| Red (badges, deletions) | `#E62644` |
| Light red (numbers, constants) | `#FF6B7F` |
| Comments | `#7388A6` |

## Development

Press F5 in VS Code to open a test window with sample files. The Third variant is generated from the base theme; after changing `themes/los-blancos-color-theme.json`, run:

```powershell
powershell -File scripts/make-third.ps1
```

## Feedback

Spotted something that looks off in your language? Open an issue with a screenshot.

## License

MIT
