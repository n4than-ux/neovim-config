return {
  {
    "numToStr/Comment.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- optional, for context-aware commenting
    config = function()
      local status_ok, comment = pcall(require, "Comment")
      if not status_ok then
        return
      end

      -- Basic setup
      comment.setup({
        padding = true, -- add space between comment and line
        sticky = true, -- maintain cursor position
        ignore = nil, -- lines to ignore
        toggler = {
          line = "gcc", -- toggle line comment
          block = "gbc", -- toggle block comment
        },
        opleader = {
          line = "gc", -- operator-pending line comment
          block = "gb", -- operator-pending block comment
        },
        extra = {
          above = "gcO", -- add comment above
          below = "gco", -- add comment below
          eol = "gcA", -- add comment at end of line
        },
        mappings = {
          basic = true,   -- enable basic mappings
          extra = true,   -- enable extra mappings
          extended = false, -- extra motions like gc[count]motion
        },
        pre_hook = nil,
        post_hook = nil,
      })

      -- Optional: Register groups for which-key (new spec style)
      local ok, wk = pcall(require, "which-key")
      if ok then
        wk.add({
          { "<leader>g",  group = "Comment" },
          { "<leader>gb", desc = "Comment block" },
          { "<leader>gc", desc = "Comment line/operator" },
        })
      end
    end,
  },
}

