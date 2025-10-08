return {
   "vim-airline/vim-airline",
   dependencies = { "vim-airline/vim-airline-themes", "nvim-tree/nvim-web-devicons" },
   config = function()
      -- Airline settings below
      vim.g.airline_powerline_fonts = 1
      vim.g.airline_theme = "base16_gruvbox_dark_hard" -- or "base16_gruvbox_dark_hard", whatever fits your colorscheme

      -- Enable tabline (buffer tabs at top)
      vim.g["airline#extensions#tabline#formatter"] = "unique_tail_improved"

      -- Enable LSP status integration
      vim.g["airline#extensions#lsp#enabled"] = 1

      -- Diagnostics symbols (if using built-in LSP)
      vim.g["airline#extensions#lsp#error_symbol"] = "E:"
      vim.g["airline#extensions#lsp#warning_symbol"] = "W:"

      -- Show file encoding and format
      vim.g["airline_section_x"] = "%{&fileencoding?&fileencoding:&encoding} [%{&fileformat}]"

      -- Powerline separators
      vim.g.airline_left_sep = ""
      vim.g.airline_left_alt_sep = ""
      vim.g.airline_right_sep = ""
      vim.g.airline_right_alt_sep = ""

      -- Custom sections (time + buffer)
      vim.g.airline_section_b = '%{strftime("%c")}'
      vim.g.airline_section_y = 'BN: %{bufnr("%")}'
   end,
}
