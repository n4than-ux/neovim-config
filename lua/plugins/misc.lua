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
		branch = "master",
		lazy = false,
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

	{
		"dstein64/vim-startuptime",
		-- lazy-load on a command
		cmd = "StartupTime",
		-- init is called during startup. Configuration for vim plugins typically should be set in an init function
		init = function()
			vim.g.startuptime_tries = 10
		end,
	},
}
