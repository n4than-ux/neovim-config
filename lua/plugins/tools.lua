return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		opts = {},
		keys = {
			{
				"<leader>ff",
				function()
					local builtin = require("telescope.builtin")
					builtin.find_files()
				end,
			},
			{
				"<leader>fg",
				function()
					local builtin = require("telescope.builtin")
					builtin.live_grep()
				end,
			},
			{
				"<leader>fb",
				function()
					local builtin = require("telescope.builtin")
					builtin.buffers()
				end,
			},
			{
				"<leader>fh",
				function()
					local builtin = require("telescope.builtin")
					builtin.help_tags()
				end,
			},
		},
	},

	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {}, -- leave empty for defaults
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / References / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		lazy = false,
		opts = {
			window = {
				mappings = {
					["<space>"] = "none", -- an example of using opts
				},
			},
		},
		keys = {
			{ "<leader>e", ":Neotree toggle<CR>", silent = true, desc = "Toggle neotree" },
		},
		config = function()
			local function set_transparency()
				vim.cmd([[
            hi! NeoTreeNormal guibg=NONE ctermbg=NONE
            hi! NeoTreeNormalNC guibg=NONE ctermbg=NONE
            hi! NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE
         ]])
			end

			set_transparency()
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "*",
				callback = set_transparency,
			})
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged_enable = true,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol",
				delay = 1000,
			},
		},
	},

	{
		"NeogitOrg/neogit",
		dependencies = {
			"sindrets/diffview.nvim",
		},
		keys = {
			{ "<leader>gg", ":Neogit<CR>", desc = "Open Neogit" },
		},
		opts = {
			disable_commit_confirmation = true,
			integrations = { diffview = true },
		},
	},

	{
		"sindrets/diffview.nvim",
		opts = {
			enhanced_diff_hl = true,
			icons = {
				folder_closed = "",
				folder_open = "",
			},
		},
	},

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

	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},

	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		opts = {
			auto_enable = true,
			preview = {
				win_height = 12,
				win_vheight = 12,
				delay_syntax = 80,
				border_chars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			},
			func_map = {
				vsplit = "<C-v>",
				ptogglemode = "z,",
				stoggleup = "",
			},
			filter = {
				fzf = {
					action_for = { ["ctrl-s"] = "split" },
					extra_opts = { "--bind", "ctrl-o:toggle-all" },
				},
			},
		},
		keys = {
			{ "<leader>fo", "<cmd>copen<cr>", desc = "Open Quickfix" },
			{ "<leader>fc", "<cmd>cclose<cr>", desc = "Close Quickfix" },
			{ "<leader>fn", "<cmd>cnext<cr>", desc = "Next Quickfix item" },
			{ "<leader>fp", "<cmd>cprev<cr>", desc = "Previous Quickfix item" },
		},
	},
}
