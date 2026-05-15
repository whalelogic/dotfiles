require "nvchad.options"

-- ~/.config/nvim/lua/custom/options.lua

-- This is your custom options file for NvChad
-- It overrides default options and extends your personal UI preferences

local opt = vim.opt
local g = vim.g
local api = vim.api

-- Change comments to orange
api.nvim_set_hl(0, "Comment", { fg = "#FFA500", italic = true })

-- UI
opt.number = true            -- Show absolute line number on the cursor line
opt.cursorline = true        -- Highlight the current line
opt.termguicolors = true     -- True color support
opt.signcolumn = "yes"        -- Always show the sign column
opt.scrolloff = 8            -- Lines of context
opt.sidescrolloff = 8        -- Columns of context

-- Tabs and indentation
opt.tabstop = 4              -- Number of spaces a tab counts for
opt.shiftwidth = 4           -- Size of an indent
opt.expandtab = true         -- Use spaces instead of tabs
opt.smartindent = true       -- Smart autoindenting

-- Behavior
opt.wrap = true             -- No line wrap
opt.swapfile = false         -- Don't use swapfile
opt.backup = false
opt.undofile = true          -- Save undo history
opt.incsearch = true
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 300         -- Faster completion
opt.writebackup = false
opt.hidden = true
opt.wrap = true

-- UI Enhancements
opt.cmdheight = 1
opt.showmode = true
opt.splitbelow = true
opt.splitright = true
opt.clipboard = "unnamedplus" -- Use system clipboard
-- set cursorlineopt to "number" to hightlight only line number
opt.cursorlineopt = "both"
opt.cursorline = true


-- Plugin-specific globals
-- Copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

-- Telescope prompt layout
vim.cmd [[
  autocmd User TelescopePreviewerLoaded setlocal number
]]

