require("keybingdings")
require("plugins")
require("ui")
require('snippets')

-- lsp
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers({
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup({
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim", "hs" },
					},
				},
			},
		})
	end,
})

-- vim
vim.cmd([[
set nowrap
set autoindent expandtab tabstop=2 shiftwidth=2
set completeopt=menu,menuone,noselect
set clipboard^=unnamed,unnamedplus
]])

-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- nvim tree
-- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt#L164
require("nvim-tree").setup({
	sort_by = "name",
	view = {
		adaptive_size = true,
		float = {
			enable = true,
		},
	},
	renderer = {
		group_empty = true,
		highlight_git = true,
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	filters = {
		dotfiles = true,
	},
})

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
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"javascript",
		"typescript",
		"css",
		"html",
	},
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
})

local status, autotag = pcall(require, "nvim-ts-autotag")
if not status then
	return
end

autotag.setup({})
