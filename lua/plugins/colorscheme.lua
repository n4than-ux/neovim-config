return { -- the colorscheme should be available when starting Neovim
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false, -- load during startup
		priority = 1000, -- load before all other start plugins
		config = function()
			-- load the colorscheme
			vim.cmd("colorscheme gruvbox")
		end,
	},
}
