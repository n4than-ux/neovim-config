return {
	{
		"HiPhish/nvim-ts-rainbow2",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			-- Rainbow is set up through treesitter, not directly
			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = true,
				},
				rainbow = {
					enable = true,
					-- Highlight groups (you can customize your own colors if you want)
					query = "rainbow-parens",
					strategy = require("ts-rainbow.strategy.global"),
				},
			})
		end,
	},
}
