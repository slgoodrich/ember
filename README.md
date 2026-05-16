# Ember

*An OLED-first theme that trades visual noise for focus.*

Ember is a warm-neutral grayscale theme for WezTerm, Ghostty, and Starship built on one principle: hierarchy through brightness, not color. Most terminal themes hand you a full rainbow and ask you to parse it. Ember hands you one gray family and gets out of the way. A brightness ladder in the same warm-gray family, each step up in lightness. No hue shifts, no cognitive load. Just "how much does this matter?" The palette is anchored in true black (#000000) so OLED pixels fully switch off: less glow, less eye strain, real depth. Foreground grays carry a subtle warm undertone rather than clinical neutral, so the terminal feels inhabited rather than sterile.

Accent colors are deliberately cool and desaturated (sage green, slate blue, dusty violet, mineral cyan) so they recede as supporting information. Wheat yellow breaks the rule as the one warm accent, reserved for numbers and values where visual weight helps scanning. Red (#ee0000) is the exception to everything: the only signal color in the palette, reserved for real errors. When something goes red, it means something.

The Starship prompt makes the hierarchy explicit. The current directory sits at the top of the brightness ladder (#ededec), the one thing you're always orienting to. Git branch, git status, and every language runtime drop to tertiary gray (#6b6b68), visible when you need them but quiet otherwise. Git status uses single-character presence indicators (•, +, ?, ↑) rather than counts or badges: something changed, not a dashboard. The prompt character is a Vercel-style triangle that flips from white to signal red on command failure. Language segments are text-only (py 3.12, node 20, rs 1.84) with no icons. Command duration appears only for commands over two seconds, in the same tertiary gray. Time and package version are available but disabled by default.

On a good OLED display, the terminal disappears into the screen: text floating in void with a directory name, a triangle, and whatever you're typing.

## Install

### WezTerm

1. Copy `wezterm/ember.lua` to your WezTerm config directory:
   - Linux/macOS: `~/.config/wezterm/`
   - Windows: `%USERPROFILE%\.config\wezterm\` or `%USERPROFILE%\.wezterm\`
2. In `wezterm.lua`, apply the theme:

   ```lua
   local wezterm = require 'wezterm'
   local config = wezterm.config_builder()
   local ember = require 'ember'

   ember.apply(config)

   return config
   ```

### Ghostty

1. Copy `ghostty/ember` to `~/.config/ghostty/themes/ember` (create the directory if it doesn't exist).
2. In `~/.config/ghostty/config`, set:

   ```
   theme = ember
   ```

   For the full OLED look, also set `window-padding-color = background` so the padding around the terminal matches true black.

### Starship

1. Back up any existing Starship config, then copy `starship/ember.toml` to `~/.config/starship.toml`.
2. Reload the shell.

### Git

Two ways to apply the theme.

**Option A: include the file (recommended).** Drop `git/ember.gitconfig` somewhere stable, then add this to your `~/.gitconfig`:

```ini
[include]
    path = /absolute/path/to/ember.gitconfig
```

If the theme updates, replace `ember.gitconfig` without touching your personal config.

**Option B: copy into your config.** Append the contents of `git/ember.gitconfig` to the bottom of your `~/.gitconfig`.

## Customization

`ember.toml` includes commented-out `[time]` and `[package]` blocks. Uncomment either if you want a prompt clock or package-version segment; both follow the same tertiary-gray styling as the rest of the prompt.

## License

MIT. See [LICENSE](LICENSE).
