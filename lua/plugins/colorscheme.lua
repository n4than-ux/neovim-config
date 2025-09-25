return { -- the colorscheme should be available when starting Neovim
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.g.gruvbox_contrast_dark = "hard"

			-- load the colorscheme here
			vim.cmd([[colorscheme gruvbox]])
		end,
	},
}
