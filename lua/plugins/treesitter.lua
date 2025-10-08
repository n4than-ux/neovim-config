return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local ts_configs = require("nvim-treesitter.configs")

		ts_configs.setup({
			-- Automatically install missing parsers
			auto_install = true,
			ensure_installed = { "lua", "javascript", "html", "css" },
			sync_install = false,

			-- Enable syntax highlighting and indentation
			highlight = { enable = true },
			indent = { enable = true },

			-- Rainbow parentheses
			rainbow = {
				enable = true,
				extended_mode = true, -- Highlight also non-bracket delimiters like html tags
				max_file_lines = 1000, -- Disable for very large files
			},
		})
	end,
}
