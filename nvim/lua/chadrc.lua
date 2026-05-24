-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "zenburn",
  statusline = {
    theme = "zenburn",
    separator_style = "block",
  },

  hl_override = {
    Directory = { fg = "#09ba8d" },

    LineNr = { fg = "#888888" },
    Visual = { bg = "#3e3e5e" },

        -- Git signs
    GitSignsAdd = { fg = "#98c379" },
    GitSignsChange = { fg = "#e5c07b" },
    GitSignsDelete = { fg = "#f44747" },
    TelescopeBorder = { bg = "#1e1e2e", fg = "#5e5e7e" },
    TelescopePromptBorder = { bg = "#2a2a3a", fg = "#61afef" },
    TelescopeResultsBorder = { bg = "#1e1e2e", fg = "#5e5e7e" },
    TelescopePreviewBorder = { bg = "#1e1e2e", fg = "#5e5e7e" },

    DiagnosticError = { fg = "#f44747" },
    DiagnosticWarn = { fg = "#ff8800" },
    DiagnosticInfo = { fg = "#76b6c9" },
    DiagnosticHint = { fg = "#c678dd" },


    -- 2. Specifically target NvimTree folder names
    NvimTreeFolderName = { fg = "#09ba8d", bold = true },
    NvimTreeOpenedFolderName = { fg = "#09ba8d", bold = true },
    NvimTreeEmptyFolderName = { fg = "#09ba8d" },

    -- 3. Change the folder icons to Green as well
    NvimTreeFolderIcon = { fg = "#09ba8d", bold = true },
    ["@comment"] = { fg = "#76b6c9", italic = true },
  },
}

M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
    lazyload = false,
  },
}

-- Configure nvim-lint (for eslint_d)
M.lint = {
  linters_by_ft = {
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
    javascriptreact = { "eslint_d" },
    typescriptreact = { "eslint_d" },
    python = { "flake8" },
    go = { "golangci_lint" },
  },
}

-- Configure conform.nvim (for prettier)
M.format = {
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    rust = { "rustfmt" },
    go = { "gofmt" },
    python = { "black" },
    html = { "prettier" },
    templ = { "prettier" },

    -- Make sure to keep the default for lua
    lua = { "stylua" },
  },
}

-- Configure nvim-treesitter parsers
M.plugins = {
  ["nvim-treesitter/nvim-treesitter"] = {
    ensure_installed = {
      -- NvChad Defaults
      "lua",
      "vim",
      "vimdoc",
      "c",
      "cpp",
      "cmake",

      -- Parsers matching your lspconfig.lua
      "html",
      "go",
      "templ",
      "python",
      "rust",
      "json",
      "yaml",
      "bash",
      "css",
      "markdown",
      "markdown_inline",

      -- Parsers for JS/TS
      "javascript",
      "typescript",
      "tsx",
    },
  },
}

return M
