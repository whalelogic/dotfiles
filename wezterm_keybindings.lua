-- =============================================================================
-- WezTerm Keybindings
-- Drop this into your wezterm.lua or require it from there:
--   local keys = require("keybindings")
-- Or paste the relevant sections directly into your wezterm.lua config.
-- =============================================================================

local wezterm = require("wezterm")
local config = wezterm.config_builder and wezterm.config_builder() or {}

-- ---------------------------------------------------------------------------
-- Hyperlink rules (default set)
-- ---------------------------------------------------------------------------
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- ---------------------------------------------------------------------------
-- Leader key: Ctrl+B (tmux-style)
-- ---------------------------------------------------------------------------
config.leader = { key = "b", mods = "CTRL" }

-- ---------------------------------------------------------------------------
-- Keybindings
-- ---------------------------------------------------------------------------
config.keys = {

  -- -------------------------------------------------------------------------
  -- Leader-based bindings
  -- -------------------------------------------------------------------------

  -- Launcher / new tab / close pane
  { key = "o", mods = "LEADER", action = wezterm.action.ShowLauncher },
  { key = "t", mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
  { key = "r", mods = "LEADER", action = wezterm.action.CloseCurrentPane({ confirm = false }) },

  -- Split panes
  { key = "h", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "v", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

  -- Navigate between panes (Leader + Arrow)
  { key = "LeftArrow",  mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
  { key = "RightArrow", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },
  { key = "UpArrow",    mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
  { key = "DownArrow",  mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },

  -- -------------------------------------------------------------------------
  -- Tab switching: Ctrl+1 through Ctrl+9
  -- -------------------------------------------------------------------------
  { key = "1", mods = "CTRL", action = wezterm.action.ActivateTab(0) },
  { key = "2", mods = "CTRL", action = wezterm.action.ActivateTab(1) },
  { key = "3", mods = "CTRL", action = wezterm.action.ActivateTab(2) },
  { key = "4", mods = "CTRL", action = wezterm.action.ActivateTab(3) },
  { key = "5", mods = "CTRL", action = wezterm.action.ActivateTab(4) },
  { key = "6", mods = "CTRL", action = wezterm.action.ActivateTab(5) },
  { key = "7", mods = "CTRL", action = wezterm.action.ActivateTab(6) },
  { key = "8", mods = "CTRL", action = wezterm.action.ActivateTab(7) },
  { key = "9", mods = "CTRL", action = wezterm.action.ActivateTab(8) },

  -- -------------------------------------------------------------------------
  -- Pane Resize: Ctrl+Shift+Arrow
  -- Resizes the active pane by 5 cells in the given direction.
  -- These are intercepted by WezTerm before reaching the shell, so no ZSH
  -- keybindings are needed for resize. The resize amount (5) can be tuned.
  -- -------------------------------------------------------------------------
  { key = "LeftArrow",  mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left",  5 }) },
  { key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
  { key = "UpArrow",    mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up",    5 }) },
  { key = "DownArrow",  mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Down",  5 }) },
}

-- ---------------------------------------------------------------------------
-- Return config (if using as a standalone module)
-- ---------------------------------------------------------------------------
return config
