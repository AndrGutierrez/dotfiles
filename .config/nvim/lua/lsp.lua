--------------------------------
-- Language servers
---------------------------------
local lspconfig= require("lspconfig")

local caps = vim.lsp.protocol.make_client_capabilities()
local no_format = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
end

-- Capabilities
caps.textDocument.completion.completionItem.snippetSupport = true
lspconfig.jsonls.setup {
  capabilities = caps,
}
-- Python
lspconfig.pyright.setup({
  capabilities = caps,
  -- on_attach = no_format
})

-- PHP
-- lspconfig.phpactor.setup({ capabilities = caps })
-- lspconfig.intelephense.setup({ capabilities = caps })
lspconfig.phpactor.setup({
    settings = {
        intelephense = {
            stubs = {
                "bcmath",
                "bz2",
                "calendar",
                "Core",
                "curl",
                "zip",
                "zlib",
                "wordpress",
                "woocommerce",
                "acf-pro",
                "wordpress-globals",
                "wp-cli",
                "genesis",
                "polylang"
            },
            environment = {
              includePaths = '/home/your-user/.composer/vendor/php-stubs/' -- this line forces the composer path for the stubs in case inteliphense don't find it...
            },
            files = {
                maxSize = 5000000;
            };
        };
    }
});

    require('lspconfig').intelephense.setup({
      on_attach = function(client, bufnr)
        -- Enable (omnifunc) completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        -- Here we should add additional keymaps and configuration options.
      end,
      flags = {
        debounce_text_changes = 150,
      }
    })
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

-- CPP
lspconfig.clangd.setup({
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

require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "phpactor" },
}

