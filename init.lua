require("options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- neovim > 0.9
-- 实验性功能，加快启动速度
vim.loader.enable()

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	defaults = {
		lazy = false,
		version = false, -- always use the latest git commit
	},
	install = { colorscheme = { "tokyonight", "habamax" } },
	checker = { enabled = false }, -- automatically check for plugin updates
	change_detection = {
		enabled = false,
		notify = false, -- get a notification when changes are found
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
require("mapping")
require("ui")
require("mo")
