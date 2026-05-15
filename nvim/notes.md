# Backup lspconfig.lua settings

-- Load NvChad defaults
require("nvchad.configs.lspconfig").defaults()


-- Servers to enable
local servers = { "html", "templ", "gopls", "clangd", "pyright", "ts_ls", "rust_analyzer" }
vim.lsp.enable(servers)

-- Ensure .templ files are recognized
vim.filetype.add({
  extension = {
    templ = "templ",
  },
})

-- Custom configs with new API
vim.lsp.config("gopls", {
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
    },
  },
})

vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = {
        command = "clippy",
      },
    },
  },
})

vim.lsp.config("templ", {
  cmd = { "templ", "lsp" },
  filetypes = { "templ" },
  root_dir = vim.fs.root(0, { "go.mod", ".git" }),
})

local custom_servers = { gopls = true, templ = true }

for _, server in ipairs(servers) do
  if not custom_servers[server] then
    -- Registering an empty config {} makes nvim-lspconfig load its defaults
    vim.lsp.config(server, {})
  end
end

