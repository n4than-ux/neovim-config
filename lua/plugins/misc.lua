return {
	{
		"tpope/vim-commentary",
		event = { "BufReadPost", "BufNewFile" },
	},

	{
		"folke/snacks.nvim",
		opts = {
			scroll = { enabled = false },
		},
		keys = {},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			auto_install = true,
			ensure_installed = { "lua", "javascript", "html", "css" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = 1000,
			},
		},
	},
}
