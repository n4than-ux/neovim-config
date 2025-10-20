local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
print("Loaded successfully!")
vim.opt.rtp:prepend(lazypath)

-- List of modules to check
local modules = { "keymaps", "options", "helper" }
for _, mod in ipairs(modules) do
	-- Try to require the module safely
	local ok, _ = pcall(require, mod)
	if ok then
		print(mod .. " loaded:D")
	end
end

require("lazy").setup({
	spec = { { import = "plugins" } },
	checker = { enabled = true },
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
