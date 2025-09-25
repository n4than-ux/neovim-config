return {
	{
		"voldikss/vim-floaterm",
		keys = {
			{ "<F12>", ":FloatermToggle<CR>", desc = "Toggle Floaterm" },
			{ "<leader>ft", ":FloatermToggle<CR>", desc = "Toggle Floaterm" },
			{ "<leader>fn", ":FloatermNext<CR>", desc = "Next Floaterm" },
			{ "<leader>fp", ":FloatermPrev<CR>", desc = "Previous Floaterm" },
		},
		config = function()
			-- Basic settings
			vim.g.floaterm_width = 0.9
			vim.g.floaterm_height = 0.6
			vim.g.floaterm_position = "center"
			vim.g.floaterm_autoclose = 1
			vim.g.floaterm_opener = "edit"

			-- Keymaps inside terminal
			vim.cmd([[
        tnoremap <Esc> <C-\><C-n>
        tnoremap <C-h> <C-\><C-n><C-w>h
        tnoremap <C-j> <C-\><C-n><C-w>j
        tnoremap <C-k> <C-\><C-n><C-w>k
        tnoremap <C-l> <C-\><C-n><C-w>l
      ]])
		end,
	},
}
