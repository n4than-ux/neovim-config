return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VeryLazy", -- load lazily
	config = function()
		require("bufferline").setup({
			options = {
				numbers = "none",
				left_mouse_command = "buffer %d",
				middle_mouse_command = nil,
				indicator = { style = "icon", icon = "|" },
				modified_icon = "o",
				close_icon = "[x]",
				left_trunc_marker = "<-",
				right_trunc_marker = "->",
				max_name_length = 30,
				max_prefix_length = 15,
				tab_size = 21,
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_tab_indicators = true,
				persist_buffer_sort = true,
				separator_style = "thin",
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				sort_by = "id",
			},
		})

		vim.opt.termguicolors = true
		-- Optional keymaps
		vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { silent = true })
		vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { silent = true })

		-- Close current buffer
		vim.keymap.set("n", "<leader>bd", ":bwipeout<CR>", { silent = true })

		-- Close all other buffers
		vim.keymap.set("n", "<leader>bD", ":BufferLineCloseOther<CR>", { silent = true })
	end,
}
