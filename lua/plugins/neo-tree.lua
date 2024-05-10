return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	keys = {
		{ "<leader>nf", "<cmd>Neotree filesystem float<cr>" },
		{ "<leader>nc", "<cmd>Neotree filesystem reveal float<cr>" },
		{ "<leader>ng", "<cmd>Neotree git_status float<cr>" },
	},
}
