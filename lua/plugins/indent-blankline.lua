return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("ibl").setup({
				indent = {
					char = "|", -- \u2502
				},
				scope = {
					enabled = true,
					show_start = true,
					show_end = true,
				},
				exclude = {
					filetypes = {
						"help",
						"lazy",
						"mason",
						"dashboard",
						"NvimTree",
						"neo-tree",
						"Trouble",
					},
				},
			})
		end,
	},
}
