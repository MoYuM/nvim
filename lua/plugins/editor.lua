---@diagnostic disable: missing-fields
return {
	-- 让错误提示显示在右上角
	{
		"dgagn/diagflow.nvim",
		opts = {},
	},
	-- 上面的面包屑
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
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
		config = function()
			require("colorizer").setup()
		end,
	},

	-- tree-sitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
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
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/projects", "~/downloads", "/" },
			})
		end,
	},

	-- 终端
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			autochdir = true,
		},
	},

	-- 更丝滑的滚动
	{
		"karb94/neoscroll.nvim",
		opts = {
			hide_cursor = false,
			easing_function = "sine",
		},
	},

	-- 滚动条
	{
		"petertriho/nvim-scrollbar",
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

	-- 行号的颜色根据当前 mode 变化
	{
		"mawkler/modicator.nvim",
		dependencies = "folke/tokyonight.nvim", -- Add your colorscheme plugin here
		init = function()
			-- These are required for Modicator to work
			vim.o.cursorline = true
			vim.o.number = true
			vim.o.termguicolors = true
		end,
		opts = {},
	},

	-- tag 文件
	{
		"cbochs/grapple.nvim",
		opts = {
			scope = "git", -- also try out "git_branch"
		},
		event = { "BufReadPost", "BufNewFile" },
		cmd = "Grapple",
		keys = {
			{ "<leader>m", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
			{ "<leader>M", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tags window" },
			{ "<leader>n", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
			{ "<leader>p", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
		},
	},
}
