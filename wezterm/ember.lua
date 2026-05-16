-- Ember — OLED-first WezTerm theme
-- Warm-neutral grayscale + one signal color. Hierarchy by brightness, not hue.

local wezterm = require 'wezterm'

local M = {}

function M.apply(config)
  config.font = wezterm.font('Geist Mono')

  -- Designed palette: warm-neutral grayscale + one signal color
  -- Hierarchy by brightness, cool-desaturated accent family, warm outlier for numbers
  config.colors = {
    -- Base
    foreground    = '#ededec',  -- primary text (95% lightness, warm undertone)
    background    = '#000000',  -- true black for OLED
    cursor_bg     = '#ededec',
    cursor_fg     = '#000000',
    cursor_border = '#ededec',
    selection_fg  = '#000000',
    selection_bg  = '#bfbfbe',  -- warm secondary gray
    -- Normal ANSI (used by most TUI programs, CLI output, etc.)
    ansi = {
      '#1c1c1b',  -- black (surface, warm undertone)
      '#ee0000',  -- red (the one signal color — errors only)
      '#a8b6a0',  -- green (desaturated sage)
      '#cbb994',  -- yellow (desaturated wheat — the warm outlier)
      '#8da4b8',  -- blue (desaturated slate)
      '#a89cb8',  -- magenta (dusty violet)
      '#9ab5b8',  -- cyan (mineral)
      '#9a9a96',  -- white (warm mid-gray)
    },
    brights = {
      '#4a4a47',  -- bright black (overlay tier)
      '#ff5555',  -- bright red
      '#bfccb6',  -- bright green
      '#ddc9a6',  -- bright yellow
      '#a3b9cb',  -- bright blue
      '#bfb0cb',  -- bright magenta
      '#aec6c9',  -- bright cyan
      '#ededec',  -- bright white (foreground)
    },

    -- Tab bar (always visible)
    tab_bar = {
      background = '#000000',
      active_tab = {
        bg_color = '#111110',
        fg_color = '#ededec',
      },
      inactive_tab = {
        bg_color = '#000000',
        fg_color = '#6b6b68',
      },
      new_tab = {
        bg_color = '#000000',
        fg_color = '#6b6b68',
      },
    },
  }

  -- Subtle warm border (visible against OLED black)
  config.window_frame = {
    border_left_width = '1px',
    border_right_width = '1px',
    border_top_height = '1px',
    border_bottom_height = '1px',
    border_left_color = '#2a2a28',
    border_right_color = '#2a2a28',
    border_top_color = '#2a2a28',
    border_bottom_color = '#2a2a28',
  }

  return config
end

return M
