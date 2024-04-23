return {{
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup()
    end
}, {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {"lua_ls", "tsserver"}
        })
    end
}, {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require('lspconfig')
        lspconfig.tsserver.setup({})
        lspconfig.lua_ls.setup({})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>fo', function()
            vim.lsp.buf.format {
                async = true
            }
        end, opts)
    end
}}