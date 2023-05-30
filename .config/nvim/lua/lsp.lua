--------------------------------
-- Language servers
---------------------------------
local lspconfig = require("lspconfig")
local caps = vim.lsp.protocol.make_client_capabilities()
local no_format = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
end

-- Capabilities
caps.textDocument.completion.completionItem.snippetSupport = true

-- Python
lspconfig.pyright.setup({
  capabilities = caps,
  on_attach = no_format
})

-- PHP
lspconfig.phpactor.setup({ capabilities = caps })

-- JavaScript/Typescript
lspconfig.tsserver.setup({
  capabilities = caps,
  on_attach = no_format
})

-- Rust
lspconfig.rust_analyzer.setup({
  capabilities = snip_caps,
  on_attach = no_format
})

-- Emmet
lspconfig.emmet_ls.setup({
  capabilities = snip_caps,
  filetypes = {
    "css",
    "html",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "typescriptreact",
  },
})



lspconfig.lua_ls.setup {
    cmd = {"lua-language-server"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
                }
            }
        }
    }
}

require("mason").setup()

