local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
print("Loaded successfully!")
vim.opt.rtp:prepend(lazypath)

-- Leader key
vim.g.mapleader = "\\"

local modules = { "keymaps", "options", "helper" }
for _, mod in ipairs(modules) do
	local modconfig = "config." .. mod
	local ok, err = pcall(require, modconfig)
	if ok then
		print(mod .. " loaded:D")
	else
		vim.notify(mod .. " failed to load: " .. err, vim.log.levels.WARN)
	end
end

require("lazy").setup({
	spec = { { import = "plugins" } },
	checker = { enabled = true },
	install = { colorscheme = { "craftzdog/solarized-osaka.nvim" } },
	defaults = {
		lazy = false,
		version = false, -- always use the latest git commit
	},
	performance = {
		cache = {
			enabled = true,
			-- disable_events = {},
		},
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"rplugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	debug = false,
})
