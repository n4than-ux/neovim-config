return {
   --colorscheme
   {
      "craftzdog/solarized-osaka.nvim",
      lazy = false,
      priority = 1000,
      opts = {
         transparent = true,     -- removes background
         terminal_colors = true, -- sync terminal colors
         styles = {
            comments = { italic = true },
            keywords = { italic = true },
            functions = {},
            variables = {},
         },
         day_brightness = 1,
      },
      config = function()
         vim.cmd.colorscheme("solarized-osaka")
      end,
   },
   --which-key
   {
      "folke/which-key.nvim",
      opts = {
         plugins = {
            spelling = { enabled = true },
         },
      },
   },
   --lualine
   {
      "vim-airline/vim-airline",
      dependencies = {
         "vim-airline/vim-airline-themes",
         "nvim-tree/nvim-web-devicons",
      },
      opts = {
         theme = "solarized",
         powerline_fonts = 1,
         tabline_formatter = "unique_tail_improved",
         lsp_enabled = 1,
         lsp_error_symbol = "X:",
         lsp_warning_symbol = "W:",
         section_x = "%{&fileencoding?&fileencoding:&encoding} [%{&fileformat}]",
         left_sep = "",
         left_alt_sep = "",
         right_sep = "",
         right_alt_sep = "",
      },
      config = function(_, opts)
         vim.g.airline_powerline_fonts = opts.powerline_fonts
         vim.g.airline_theme = opts.theme
         vim.g["airline#extensions#tabline#formatter"] = opts.tabline_formatter
         vim.g["airline#extensions#lsp#enabled"] = opts.lsp_enabled
         vim.g["airline#extensions#lsp#error_symbol"] = opts.lsp_error_symbol
         vim.g["airline#extensions#lsp#warning_symbol"] = opts.lsp_warning_symbol
         vim.g["airline_section_x"] = opts.section_x
         vim.g.airline_left_sep = opts.left_sep
         vim.g.airline_left_alt_sep = opts.left_alt_sep
         vim.g.airline_right_sep = opts.right_sep
         vim.g.airline_right_alt_sep = opts.right_alt_sep
      end,
   },
   -- bufferline
   {
      "akinsho/bufferline.nvim",
      dependencies = "nvim-tree/nvim-web-devicons",
      event = "VeryLazy",
      opts = {
         options = {
            numbers = "none",
            left_trunc_marker = "<-",
            right_trunc_marker = "->",
            max_name_length = 30,
            max_prefix_length = 15,
            tab_size = 20,
            show_tab_indicators = true,
            persist_buffer_sort = true,
            separator_style = "thin",
            enforce_regular_tabs = false,
            always_show_bufferline = true,
         },
      },
      config = function()
         vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { silent = true })
         vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { silent = true })
         vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { silent = true })
         vim.keymap.set("n", "<leader>bD", ":BufferLineCloseOther<CR>", { silent = true })
      end,
   },
   -- indent-blankline
   {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      event = { "BufReadPost", "BufNewFile" },
      opts = {
         indent = { char = "|" },
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
      },
   },
   -- nvim-notify
   {
      "rcarriga/nvim-notify",
      lazy = true,
      opts = {
         stages = "fade_in_slide_out",
         fps = 144,
         timeout = 1000,
         background_colour = "#000000",
         render = "compact",
         top_down = false, -- newest notifications at the bottom
      },
   },
   -- noice.nvim
   {
      "folke/noice.nvim",
      event = "VeryLazy",
      dependencies = {
         "MunifTanjim/nui.nvim",
         "rcarriga/nvim-notify",
      },
      opts = {
         lsp = {
            progress = { enabled = true },
            override = {
               ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
               ["vim.lsp.util.stylize_markdown"] = true,
               ["cmp.entry.get_documentation"] = true,
            },
            hover = { enabled = true },
            signature = { enabled = true },
            message = { enabled = true },
         },
         presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            inc_rename = false,
            lsp_doc_border = true,
         },
         routes = {
            {
               filter = { event = "msg_show", kind = "", find = "written" },
               opts = { skip = true },
            },
            {
               filter = { event = "lsp", kind = "progress" },
               opts = { skip = true },
            },
         },
         cmdline = { view = "cmdline_popup" },
         views = {
            cmdline_popup = {
               position = { row = "50%", col = "50%" },
               size = { width = 60, height = "auto" },
               border = { style = "rounded", padding = { 0, 1 } },
               win_options = {
                  winblend = 10,
                  winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
               },
               zindex = 200,
            },
            popupmenu = {
               relative = "editor",
               position = { row = "50%", col = "50%" },
               size = { width = 60, height = 10 },
               border = { style = "rounded", padding = { 0, 1 } },
               win_options = {
                  winblend = 10,
                  winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,PmenuSel:Visual",
                  cursorline = true,
               },
               zindex = 200,
            },
         },
         health = { checker = false },
      },
   },
   --rainbow-bracket
   {
      "HiPhish/rainbow-delimiters.nvim",
      opts = function()
         local rainbow_delimiters = require("rainbow-delimiters")

         return {
            strategy = {
               [""] = rainbow_delimiters.strategy.global,
               -- vim = rainbow_delimiters.strategy.local,
            },
            query = {
               [""] = "rainbow-delimiters",
               lua = "rainbow-blocks",
            },
            highlight = {
               "RainbowDelimiterRed",
               "RainbowDelimiterYellow",
               "RainbowDelimiterBlue",
               "RainbowDelimiterOrange",
               "RainbowDelimiterGreen",
               "RainbowDelimiterViolet",
               "RainbowDelimiterCyan",
            },
         }
      end,
      config = function(_, opts)
         vim.g.rainbow_delimiters = opts
      end,
   },
   --render-markdown
   {
      'MeanderingProgrammer/render-markdown.nvim',
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
      ---@module 'render-markdown'
      ---@type render.md.UserConfig
      opts = {},
   },
}
