---@diagnostic disable: missing-fields
---@type LazyPluginSpec[]
return {
	-- 让错误提示显示在右上角
	{
		"dgagn/diagflow.nvim",
		event = "VeryLazy",
		opts = {},
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
				autotag = {
					enable = true,
				},
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
		opts = {
			hide_cursor = false,
			easing_function = "sine",
		},
	},

	-- 滚动条
	{
		"petertriho/nvim-scrollbar",
		enabled = false,
		config = function()
			local colors = require("tokyonight.colors").setup()

			require("scrollbar").setup({
				handle = {
					color = colors.bg_highlight,
				},
				marks = {
					Cursor = { text = "" },
					Search = { color = colors.orange },
					Error = { color = colors.error },
					Warn = { color = colors.warning },
					Info = { color = colors.info },
					Hint = { color = colors.hint },
					Misc = { color = colors.purple },
				},
				handlers = {
					cursor = false,
				},
			})
		end,
	},

	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		cmd = {
			"CopilotChat",
			"CopilotChatOpen",
			"CopilotChatClose",
			"CopilotChatToggle",
			"CopilotChatReset",
			"CopilotChatSave",
			"CopilotChatLoad",
			"CopilotChatExplain",
			"CopilotChatTests",
			"CopilotChatFix",
			"CopilotChatOptimize",
			"CopilotChatDocs",
			"CopilotChatFixDiagnostic",
			"CopilotChatCommit",
			"CopilotChatCommitStaged",
		},
		opts = {},
	},

	-- devdoc
	{
		"luckasRanarison/nvim-devdocs",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
    event = "VeryLazy",
		opts = {
			after_open = function(bufnr)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<Esc>", ":close<CR>", {})
			end,
		},
	},
}
