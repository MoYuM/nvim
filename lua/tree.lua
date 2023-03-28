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

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
