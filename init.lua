require("plugins")
require("ui")
require('postfix')
require('lsp')
require('tree')
require('cmpsetup')
require("lspsaga").setup({})
require("treesitter")
require("keybingdings")

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

-- format
vim.g.neoformat_basic_format_align = 1
vim.g.neoformat_basic_format_retab = 1
vim.g.neoformat_basic_format_trim = 1
vim.g.neoformat_run_all_formatters = 1

-- beacon
vim.g.beacon_minimal_jump = 10
