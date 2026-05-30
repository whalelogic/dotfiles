return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    -- This plugin automatically attaches to treesitter, 
    -- no setup function required for default behavior.
  },

  -- Statusline: clean, informative
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup {
        options = {
          icons_enabled = true,
          theme = "auto",
          section_separators = '',
          component_separators = ''
        }
      }
    end
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      -- Optional: Auto-close the preview when switching buffers
      vim.g.mkdp_auto_close = 1
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        ui = { 
          border = "bold",
          devicon = true,
          title = true,
          expand = "",
          collapse = "",
          actionfix = "",
          code_action = "💡",
          lines = { "┗", "┣", "┃", "━", "┏" },
        },
        symbol_in_winbar = { enable = false },
        beacon = {
          enable = true,
          frequency = 7,
        },
      })
      -- K shows docs
      vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true, desc = "Hover docs" })
      -- Extras you’ll want:
      vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>", { silent = true })
      vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<C-l>",
            next = "<C-]>",
            prev = "<C-[>",
            dismiss = "<C-e>",
          },
        },
        panel = { enabled = false },
        filetypes = {
          markdown = true,
          gitcommit = true,
          yaml = true,
          ["*"] = true,
        },
      })
    end,
  },

  -- Dashboard: startup screen
  {
    "goolord/alpha-nvim",
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
    end
  },

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  -- SINGLE, MERGED TREESITTER CONFIG
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "vim", "lua", "vimdoc", "bash",
        "html", "css", "go", "rust", "javascript", "typescript", "python", "cpp", "ruby"
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "tsserver",
          "pyright",
          "gopls",
          "bash-language-server",
          "superhtml",
          "jsonls",
          "yamlls",
          "javascript",
          "typescript",
          "templ",
          "tailwindcss",
          "htmx",
          "html",
          "cssls",
          "clangd",
          "rust_analyzer",
        }
      }
    end
  }
}
