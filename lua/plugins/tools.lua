return {
   {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.8",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
         local builtin = require("telescope.builtin")
         vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
         vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
         vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
         vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
      end,
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
         "nvim-lua/plenary.nvim",
         "MunifTanjim/nui.nvim",
         "nvim-tree/nvim-web-devicons", -- optional, but recommended
      },
      lazy = false,
      config = function()
         vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { silent = true })

         local function set_transparency()
            vim.cmd([[
        hi! NeoTreeNormal guibg=NONE ctermbg=NONE
        hi! NeoTreeNormalNC guibg=NONE ctermbg=NONE
        hi! NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE
      ]])
         end

         -- apply immediately
         set_transparency()

         -- reapply whenever the colorscheme changes
         vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "*",
            callback = set_transparency,
         })
      end,
   },

   {
      "lewis6991/gitsigns.nvim",
      event = { "BufReadPre", "BufNewFile" },
      config = function()
         require("gitsigns").setup({
            signs = {
               add = { text = "┃" },
               change = { text = "┃" },
               delete = { text = "_" },
               topdelete = { text = "‾" },
               changedelete = { text = "~" },
               untracked = { text = "┆" },
            },
            signs_staged = {
               add = { text = "┃" },
               change = { text = "┃" },
               delete = { text = "_" },
               topdelete = { text = "‾" },
               changedelete = { text = "~" },
               untracked = { text = "┆" },
            },
            signs_staged_enable = true,
            signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
            numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
               follow_files = true,
            },
            auto_attach = true,
            attach_to_untracked = false,
            current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
               virt_text = true,
               virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
               delay = 1000,
               ignore_whitespace = false,
               virt_text_priority = 100,
               use_focus = true,
            },
            current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- Use default
            max_file_length = 40000, -- Disable if file is longer than this (in lines)
            preview_config = {
               -- Options passed to nvim_open_win
               style = "minimal",
               relative = "cursor",
               row = 0,
               col = 1,
            },
         })
      end,
   },
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
               diffview = true,         -- integrate with diffview.nvim
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
