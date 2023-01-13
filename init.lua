require("keybingdings")
require("plugins")
require('ui')

-- lsp
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers({
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup({})
	end,
})

-- colorschema
vim.cmd([[colorscheme tokyonight]])

-- vim
vim.cmd([[
set nowrap
set autoindent expandtab tabstop=2 shiftwidth=2
set completeopt=menu,menuone,noselect
]])

vim.o.signcolumn = "yes"
vim.o.number = true

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
local cmp = require("cmp")
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- For luasnip users.
	}, {
		{ name = "buffer" },
	}),
})

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

