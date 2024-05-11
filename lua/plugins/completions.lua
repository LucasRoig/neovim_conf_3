return {
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    --    {
    --       "github/copilot.vim",
    --  },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            --"rafamadriz/friendly-snippets"
        },
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            local ls = require("luasnip")
            --require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_snipmate").lazy_load()

            --Set keymap for moving from slot to slot in snippets
            vim.keymap.set({ "i", "s" }, "<Tab>", function()
                if ls.locally_jumpable(1) then
                    ls.jump(1)
                else
                    return "<Tab>"
                end
            end, { silent = true, expr = true })

            vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
                if ls.locally_jumpable(-1) then
                    ls.jump(-1)
                else
                    return "<S-Tab>"
                end
            end, { silent = true, expr = true })

            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- For luasnip users.
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },
}
