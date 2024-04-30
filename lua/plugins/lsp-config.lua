local lspservers = {
    "lua_ls", "tsserver", "eslint", "jsonls"
}

return {{
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup()
    end
}, {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = lspservers
        })
    end
}, {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require('lspconfig')

        -- Call setup with capabilities on each server
        for _, server in ipairs(lspservers) do
            lspconfig[server].setup({
                capabilities = capabilities,
            })
        end

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
