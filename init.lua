require("plugins")
require("keybingdings")
require("ui")
require('postfix')
require('lsp')
require('tree')

-- vim
vim.cmd([[
set nowrap
set autoindent expandtab tabstop=2 shiftwidth=2
set completeopt=menu,menuone,noselect
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

-- git-blame
vim.g.gitblame_date_format = '%r'
vim.g.gitblame_message_template = 'ﰗ <summary> - שּ <author> - ﮮ <date>'

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- cmp
require('cmpsetup')

-- format
vim.g.neoformat_basic_format_align = 1
vim.g.neoformat_basic_format_retab = 1
vim.g.neoformat_basic_format_trim = 1
vim.g.neoformat_run_all_formatters = 1

-- lspsaga
require("lspsaga").setup({})

-- treesitter
-- require("nvim-treesitter.configs").setup({
-- 	ensure_installed = {
-- 		"javascript",
-- 		"typescript",
-- 		"css",
-- 		"html",
-- 	},
-- 	sync_install = true,
-- 	auto_install = true,
-- 	highlight = {
-- 		enable = true,
-- 		additional_vim_regex_highlighting = false,
-- 	},
-- 	indent = {
-- 		enable = true,
-- 	},
-- 	autotag = {
-- 		enable = true,
-- 	},
-- })

local status, autotag = pcall(require, "nvim-ts-autotag")
if not status then
	return
end

autotag.setup({})
