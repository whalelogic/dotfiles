local options = {
  formatters_by_ft = {
    lua = { "stylua" },
     css = { "prettier" },
     html = { "prettier" },
     go = { "gofmt" },
     python = { "black" },
     javascript = { "prettier" },
     rust = { "rust-analyzer" },
     markdown = { "markdownlint", "mdformat" },
  },

   format_on_save = {
     -- These options will be passed to conform.format()
     timeout_ms = 500,
     lsp_fallback = true,
   },
}

return options
