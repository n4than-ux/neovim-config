return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim", -- optional, for viewing diffs/branches
		},
		keys = {
			{ "<leader>gg", ":Neogit<CR>", desc = "Open Neogit" },
		},
		config = function()
			require("neogit").setup({
				disable_commit_confirmation = true, -- commit without extra prompt
				integrations = {
					diffview = true, -- integrate with diffview.nvim
				},
			})
		end,
	},
	{
		"sindrets/diffview.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("diffview").setup({
				enhanced_diff_hl = true,
				icons = {
					folder_closed = "",
					folder_open = "",
				},
			})
		end,
	},
}
