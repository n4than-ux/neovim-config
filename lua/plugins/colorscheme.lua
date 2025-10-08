return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- Protect against errors if gruvbox isn't installed yet
			local ok, gruvbox = pcall(require, "gruvbox")
			if not ok then
				vim.notify("Gruvbox not found!", vim.log.levels.ERROR)
				return
			end

			gruvbox.setup({
				transparent_mode = true,
				terminal_colors = true, -- match terminal colors if possible
				contrast = "soft", -- can be "hard", "medium", or "soft"
				italic = {
					strings = false,
					comments = true,
					operators = false,
					folds = true,
				},
				overrides = {}, -- if you ever want to tweak highlight groups later
			})

			vim.cmd.colorscheme("gruvbox")

			-- Optional: make floating windows transparent too
			local hl_groups = { "Normal", "NormalNC", "NormalFloat", "SignColumn", "StatusLine", "StatusLineNC" }
			for _, group in ipairs(hl_groups) do
				vim.api.nvim_set_hl(0, group, { bg = "none" })
			end
		end,
	},
}
