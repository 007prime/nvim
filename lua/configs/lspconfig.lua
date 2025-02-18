-- EXAMPLE 
local base = require("nvchad.configs.lspconfig").base
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities



local lspconfig = require "lspconfig"
local servers = { "html", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    base=base,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  base=base,
}

lspconfig.clangd.setup{
    --
    -- on_attach=function ()
    --
    --   client.server_capabilities.signatureHelpProvider=false
    --   on_attach(client,bufnr)
    -- end,
    --
    -- capabilities=capabilities,

  on_attach=on_attach,
  on_init=on_init,
  capabilities=capabilities,
  base=base,
}
