return {{
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = {'nvim-lua/plenary.nvim'},
    keys = {{
        "<leader>ff",
        "<cmd>Telescope find_files<cr>",
        desc = "Find files"
    }, {
        "<leader>fg",
        "<cmd>Telescope live_grep<cr>",
        desc = "Live grep"
    }, {
        "<leader>fb",
        "<cmd>Telescope buffers<cr>",
        desc = "List buffers"
    }, {
        "<leader>fh",
        "<cmd>Telescope help_tags<cr>",
        desc = "Find help"
    }},
    config = true
}, {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
        require('telescope').setup({
            extensions = {
                ["ui-select"] = {require("telescope.themes").get_dropdown {
                    -- even more opts
                }}
            }
        })
        require("telescope").load_extension("ui-select")
    end
}}
