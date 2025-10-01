return {
   {
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("ibl").setup({
				indent = {
					char = "│", -- could be "▏" or "┊" if you like thinner lines
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
