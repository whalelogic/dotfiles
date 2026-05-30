require "nvchad.mappings"

local map = vim.keymap.set

-- Normal mode: ; to enter command mode
map("n", ";", ":", { desc = "CMD enter command mode" })
-- Insert mode: jk to escape
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
-- Multi-mode: Ctrl+s to save
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>", { desc = "Save file" })
-- Normal mode: Toggle Copilot
map("n", "<leader>ct", ":Copilot disable<CR>", { desc = "Disable Copilot", noremap = true, silent = true })
-- Insert mode: Shift+Backspace -> move cursor right (weird but valid)
map("i", "<S-BS>", "<Right>", { desc = "Shortcut for move <Right> once." })

map("i", ";;", ":=", { desc = "Quick := " })

map("n", "<leader>mp", ":MarkdownPreviewToggle<cr>", { desc = "Toggle Markdown Preview" })

