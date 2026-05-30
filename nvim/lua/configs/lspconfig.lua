-- local nvchad_conf = require("nvchad.configs.lspconfig")
--
-- -- Load NvChad defaults
-- nvchad_conf.defaults()
--
-- -- 1. GET BLINK CAPABILITIES
-- local capabilities = require("blink.cmp").get_lsp_capabilities()
--
-- -- ====================================================================
-- -- NEW SECTION: Define the "On Attach" function
-- -- This runs NvChad's defaults FIRST, then forces 'K' to use Lspsaga
-- -- ====================================================================
-- local custom_on_attach = function(client, bufnr)
--   -- 1. Run standard NvChad mappings (gd, gr, etc.)
--   nvchad_conf.on_attach(client, bufnr)
--
--   -- 2. OVERRIDE 'K' to use Lspsaga (The pretty UI)
--   vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { buffer = bufnr, silent = true })
-- end
-- -- ====================================================================
--
--
-- -- 2. DEFINE SERVERS
-- local servers = { "html", "templ", "gopls", "clangd", "pyright", "ts_ls", "rust_analyzer" }
--
-- -- 3. CONFIGURE RUST ANALYZER
-- vim.lsp.config("rust_analyzer", {
--   capabilities = capabilities,
--   on_attach = custom_on_attach, -- <--- ADDED THIS
--   settings = {
--     ["rust-analyzer"] = {
--       cargo = { allFeatures = true },
--       checkOnSave = true,
--       check = { command = "clippy" },
--       diagnostics = { enable = true },
--     },
--   },
-- })
--
-- -- 4. CONFIGURE GOPLS
-- vim.lsp.config("gopls", {
--   capabilities = capabilities,
--   on_attach = custom_on_attach, -- <--- ADDED THIS
--   settings = {
--     gopls = {
--       analyses = { unusedparams = true },
--       staticcheck = true,
--     },
--   },
-- })
--
-- -- 5. CONFIGURE TEMPL
-- vim.lsp.config("templ", {
--   capabilities = capabilities,
--   on_attach = custom_on_attach, -- <--- ADDED THIS
--   cmd = { "templ", "lsp" },
--   filetypes = { "templ" },
--   root_dir = vim.fs.root(0, { "go.mod", ".git" }),
-- })
--
-- -- 6. CONFIGURE REMAINING SERVERS
-- local configured_servers = { rust_analyzer = true, gopls = true, templ = true }
--
-- for _, server in ipairs(servers) do
--   if not configured_servers[server] then
--     vim.lsp.config(server, {
--       capabilities = capabilities,
--       on_attach = custom_on_attach, -- <--- ADDED THIS
--     })
--   end
-- end
--
-- -- 7. ENABLE SERVERS
-- vim.lsp.enable(servers)
--
-- -- 8. ENSURE FILETYPE FOR TEMPL
-- vim.filetype.add({
--   extension = {
--     templ = "templ",
--   },
-- })

local nvchad_conf = require("nvchad.configs.lspconfig")

-- Load NvChad defaults
nvchad_conf.defaults()

-- 1. GET BLINK CAPABILITIES
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- ====================================================================
-- NEW SECTION: Define the "On Attach" function
-- This runs NvChad's defaults FIRST, then forces 'K' to use Lspsaga
-- ====================================================================
local custom_on_attach = function(client, bufnr)
  -- 1. Run standard NvChad mappings (gd, gr, etc.)
  nvchad_conf.on_attach(client, bufnr)

  -- 2. OVERRIDE 'K' to use Lspsaga (The pretty UI)
  vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { buffer = bufnr, silent = true })
end
-- ====================================================================

-- 2. DEFINE SERVERS (Added "marksman" here)
local servers = { 
  "html", "templ", "gopls", "pyright", "clangd", "pyright", "rust_analyzer", "marksman" 
}

-- 3. CONFIGURE RUST ANALYZER
vim.lsp.config("rust_analyzer", {
  capabilities = capabilities,
  on_attach = custom_on_attach,
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = true,
      check = { command = "clippy" },
      diagnostics = { enable = true },
    },
  },
})

-- 4. CONFIGURE GOPLS
vim.lsp.config("gopls", {
  capabilities = capabilities,
  on_attach = custom_on_attach,
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
    },
  },
})

-- 5. CONFIGURE TEMPL
vim.lsp.config("templ", {
  capabilities = capabilities,
  on_attach = custom_on_attach,
  cmd = { "templ", "lsp" },
  filetypes = { "templ" },
  root_dir = vim.fs.root(0, { "go.mod", ".git" }),
})

-- 6. CONFIGURE REMAINING SERVERS
local configured_servers = { rust_analyzer = true, gopls = true, templ = true }

for _, server in ipairs(servers) do
  if not configured_servers[server] then
    vim.lsp.config(server, {
      capabilities = capabilities,
      on_attach = custom_on_attach,
    })
  end
end

-- 7. ENABLE SERVERS
vim.lsp.enable(servers)

-- 8. ENSURE FILETYPE FOR TEMPL
vim.filetype.add({
  extension = {
    templ = "templ",
  },
})
