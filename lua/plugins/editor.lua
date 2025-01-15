---@diagnostic disable: missing-fields
---@type LazyPluginSpec[]
return {
	-- 让错误提示显示在右上角
	{
		"dgagn/diagflow.nvim",
		event = "VeryLazy",
		opts = {
			text_align = "left",
		},
	},
	-- 上面的面包屑
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		event = "BufEnter",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			theme = "tokyonight",
		},
	},

	-- 文件导航
	{
		"nvim-tree/nvim-tree.lua",
		keys = {
			{ "1", "<cmd>:NvimTreeFindFileToggle<cr>", desc = "nvimtree" },
		},
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwplugin = 1
			vim.opt.termguicolors = true
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
		end,
	},

	-- 让颜色显示出来
	{
		"norcalli/nvim-colorizer.lua",
		opts = {},
		event = "VeryLazy",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- tree-sitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		-- event = "VeryLazy",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"html",
					"javascript",
					"jsdoc",
					"json",
					"lua",
					"luadoc",
					"luap",
					"markdown",
					"markdown_inline",
					"python",
					"query",
					"regex",
					"toml",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"yaml",
					"vue",
				},
				highlight = {
					enable = true,
					use_languagetree = true,
				},
				indent = { enable = true },
			})
		end,
	},

	-- 自动保存 session，快速回到之前的状态
	{
		"rmagatti/auto-session",
		opts = {},
	},

	-- 终端
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		version = "*",
		opts = {
			autochdir = true,
		},
	},

	-- 更丝滑的滚动
	{
		"karb94/neoscroll.nvim",
		event = "VeryLazy",
		config = function()
			local opts = {
				hide_cursor = false,
				easing_function = "sine",
			}

			if vim.g.neovide then
				-- Put anything you want to happen only in Neovide here
			else
				require("neoscroll").setup(opts)
			end
		end,
	},

  -- bigfile
	{
		"LunarVim/bigfile.nvim",
	},
}
