return {
    {"vim-airline/vim-airline", 
         lazy = false,  -- load on startup
        config = function()
            -- Enable powerline fonts if you use them
            vim.g.airline_powerline_fonts = 1
            -- Set the theme (example: 'horizon', 'molokai', 'dark')
            vim.g.airline_theme = "base16_gruvbox_dark_hard"
        end,
    }, {"vim-airline/vim-airline-themes"}
}
