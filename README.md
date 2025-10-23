## 🧩 My Neovim Configuration

- **Neovim:** 0.10 or newer
- **Plugin manager:** lazy.nvim
- Recommended **dependencies**<br>
Install and add the *bin* folder to your system **PATH**):
    - [Gzip](https://gnuwin32.sourceforge.net/packages/gzip.htm)
    - [Wget](https://gnuwin32.sourceforge.net/packages/wget.htm)
    - [Unzip](https://gnuwin32.sourceforge.net/packages/unzip.htm)
    - [Msys2](https://www.msys2.org/) (follow setup instructions on the site)
    - [Luarocks](https://luarocks.org/)
    - [Nerd Font](https://www.nerdfonts.com/font-downloads)
    - [Ripgrep](https://github.com/BurntSushi/ripgrep)
    - [fd](https://github.com/sharkdp/fd)
    - [Git](https://git-scm.com/)

## ⚙️ Setup

Clone the configuration into your Neovim configuration directory :

```
git clone https://github.com/n4than-ux/neovim-config.git ~/.config/nvim
```

For Windows:

```
git clone https://github.com/n4than-ux/neovim-config.git $env:LOCALAPPDATA\nvim
```

Start Neovim to allow lazy.nvim to install and synchronize all listed plugins.

## 🗂️ My Folder Structure

### Linux / macOS
```
~/.config/nvim/
├─ init.lua
├─ lazy-lock.json
├─ lua/
│  ├─ config/
│  │  ├─ options.lua
│  │  ├─ keymaps.lua
│  │  ├─ lazy.lua
│  │  └─ helper.lua
│  │
│  ├─ plugins/
│  │  ├─ git.lua
│  │  ├─ lsp.lua
│  │  ├─ misc.lua
│  │  ├─ tools.lua
│  │  └─ ui.lua
│  │
│  └─ utils/
│     └─ helpers.lua
│
└─ README.md

```

### Windows
```
~/Appdata/Local/nvim
├─ init.lua
├─ lazy-lock.json
├─ lua/
│  ├─ config/
│  │  ├─ options.lua
│  │  ├─ keymaps.lua
│  │  ├─ lazy.lua
│  │  └─ helper.lua
│  │
│  ├─ plugins/
│  │  ├─ git.lua
│  │  ├─ lsp.lua
│  │  ├─ misc.lua
│  │  ├─ tools.lua
│  │  └─ ui.lua
│  │
│  └─ utils/
│     └─ helpers.lua
│
└─ README.md
```

## 🔌 My Pre-install Plugins

Plugins are organized by functionality and loaded through separate Lua modules in lua/plugins/.

### git.lua

```
return {
  { "pwntester/octo.nvim" },
  { "lewis6991/gitsigns.nvim" },
}
```
Git integration and inline diff signs for better version control inside Neovim.

### lsp.lua
```
return {
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "folke/lazydev.nvim" },
  { "stevearc/conform.nvim" },
  { "L3MON4D3/LuaSnip" },
  { "hrsh7th/nvim-cmp" },
  { "rachartier/tiny-inline-diagnostic.nvim" },
  { "neovim/nvim-lspconfig" },
}
```
Language support stack for autocompletion, diagnostics, and formatting.

### misc.lua
```    
return {
  { "numToStr/Comment.nvim" },
  { "folke/snacks.nvim" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "dstein64/vim-startuptime" },
  { "m4xshen/hardtime.nvim" },
  { "petertriho/nvim-scrollbar" },
  { "kevinhwang91/nvim-hlslens" },
}
```
General-purpose tools for better text editing, code insight, and performance tracking.

### tools.lua
```
return {
  { "nvim-telescope/telescope.nvim" },
  { "folke/trouble.nvim" },
  { "nvim-neo-tree/neo-tree.nvim" },
  { "voldikss/vim-floaterm" },
  { "nvim-lua/plenary.nvim" },
  { "kevinhwang91/nvim-bqf" },
}
```
Telescope and file exploration tools for navigation, quick search, and workspace management.

### ui.lua
```
return {
  { "craftzdog/solarized-osaka.nvim" },
  { "folke/which-key.nvim" },
  { "nvim-lualine/lualine.nvim" },
  { "akinsho/bufferline.nvim" },
  { "lukas-reineke/indent-blankline.nvim" },
  { "rcarriga/nvim-notify" },
  { "folke/noice.nvim" },
  { "HiPhish/rainbow-delimiters.nvim" },
  { "MeanderingProgrammer/render-markdown.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  { "mhinz/vim-startify" },
  { "rachartier/tiny-glimmer.nvim" },
  { "j-hui/fidget.nvim" },
  { "folke/twilight.nvim" },
  { "norcalli/nvim-colorizer.lua" },
}
```
Visual plugins for color, typography, and interface polish.

## 🧩 Post-Installation

Run Neovim and trigger Lazy’s sync:
```
:Lazy sync
```

Verify plugins load correctly:

```
:checkhealth
```

## ⌨️ My most used keymaps

🔑 My leader key: Space Bar

| Keybinding    | Mode   | Action                 |
|---------------|--------|------------------------|
| `<leader>ff`  | Normal | Find files             |
| `<leader>fg`  | Normal | Live grep              |
| `<leader>e`   | Normal | Open file explorer     |
| `gcc`         | Normal | Toggle comment         |
| `\\`          | Normal | Format code            |
| `<leader>km`  | Normal | Show keymaps list      |
| `<leader>y`   | Visual | Copy to clipboard      |
| `<leader>p`   | Visual | Paste from clipboard   |


## 🔗 Credits

Built with:
- [Neovim](https://neovim.io/)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- Community plugins listed above

## ⚖️ License
This configuration is provided for personal reference only.  
All rights reserved © 2025 Nathan.
