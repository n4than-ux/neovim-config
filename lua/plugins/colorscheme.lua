return { -- the colorscheme should be available when starting Neovim
	{
		"rebelot/kanagawa.nvim",
		lazy = false, -- load during startup
		priority = 1000, -- load before all other start plugins
		config = function()
			require("kanagawa").setup({
				compile = false, -- run :KanagawaCompile if you enable this
				undercurl = true,
				commentStyle = { italic = true },
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				transparent = false,
				dimInactive = false,
				terminalColors = true,
				theme = "wave", -- or "dragon", "lotus"
				background = {
					dark = "wave", -- try "dragon" for a different dark look
					light = "lotus",
				},
			})

			-- load the colorscheme
			vim.cmd("colorscheme kanagawa")
		end,
	},
}
