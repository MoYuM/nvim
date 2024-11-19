---@diagnostic disable: missing-fields
---@type LazyPluginSpec[]
return {
	-- 自动补全标签
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = false, -- Auto close on trailing </
				},
			})
		end,
	},

	-- 高亮代码中其他和当前选中的一样的单词
	{
		"rrethy/vim-illuminate",
		event = "insertenter",
	},

	-- 最近文件
	{
		"smartpde/telescope-recent-files",
		event = "VeryLazy",
	},

	-- 自动保存
	{
		"pocco81/auto-save.nvim",
		event = "VeryLazy",
	},

	-- 快速移动代码
	{
		"fedepujol/move.nvim",
		opts = {},
		event = "VeryLazy",
	},

	-- format
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				-- Customize or remove this keymap to your liking
				"=",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "n",
				desc = "Format buffer",
			},
		},
		-- Everything in opts will be passed to setup()
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { { "prettierd", "prettier" } },
			},
			-- Set up format-on-save
			-- format_on_save = { timeout_ms = 500, lsp_fallback = true },
			-- Customize formatters
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
			},
		},
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},

	-- 快捷选中更多的 target
	{
		"wellle/targets.vim",
	},

	-- 更明显的 TODO 注释
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
		event = "VeryLazy",
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		event = "VeryLazy",
		config = function()
			require("telescope").setup({
				defaults = {
					layout_config = {
						width = 0.9,
						height = 0.9,
					},
				},
				pickers = {},
				extensions = {
					recent_files = {
						only_cwd = true,
					},
					live_grep_args = {
						auto_quoting = false,
					},
				},
			})
			require("telescope").load_extension("recent_files")
			require("telescope").load_extension("live_grep_args")
		end,
	},

	-- github copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		lazy = false,
		config = function()
			require("copilot").setup({
				suggestion = {
					accept = false,
					enable = true,
					auto_trigger = true,
					keymap = {
						accept = "<c-;>",
					},
				},
				panel = { enabled = false },
			})
		end,
	},

	-- 自动括号补全,
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		opts = {},
	},

	-- 自动补全
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"l3mon4d3/luasnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
		config = function()
			require("configs.cmp")
		end,
		event = { "insertenter", "CmdlineEnter" },
	},

	-- 更好的 jj 退出
	{
		"max397574/better-escape.nvim",
		event = "insertenter",
		config = function()
			require("better_escape").setup()
		end,
	},

	-- 注释
	{
		"numtostr/Comment.nvim",
		dependencies = {
			"joosepalviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
		keys = {
			"gcc",
			{
				"gc",
				mode = "v",
			},
		},
	},

	-- 快捷键
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	},

	-- 转换对象数组的写法
	{
		"wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {},
		keys = { "<leader>m" },
	},

	-- 折叠
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			local handler = function(virtText, lnum, endLnum, width, truncate)
				local newVirtText = {}
				local suffix = (" 󰁂 %d "):format(endLnum - lnum)
				local sufWidth = vim.fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth = 0
				for _, chunk in ipairs(virtText) do
					local chunkText = chunk[1]
					local chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if targetWidth > curWidth + chunkWidth then
						table.insert(newVirtText, chunk)
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						local hlGroup = chunk[2]
						table.insert(newVirtText, { chunkText, hlGroup })
						chunkWidth = vim.fn.strdisplaywidth(chunkText)
						-- str width returned from truncate() may less than 2nd argument, need padding
						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end
				table.insert(newVirtText, { suffix, "MoreMsg" })
				return newVirtText
			end

			-- global handler
			require("ufo").setup({
				enable_get_fold_virt_text = true,
				fold_virt_text_handler = handler,
			})
		end,
	},

	-- 快速跳转
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
		keys = { "s", "S" },
	},

	{
		"smoka7/multicursors.nvim",
		event = "VeryLazy",
		dependencies = {
			"smoka7/hydra.nvim",
		},
		opts = {
			hint_config = {
				border = "rounded",
				position = "bottom-right",
			},
			generate_hints = {
				normal = true,
				insert = true,
				extend = true,
				config = {
					column_count = 1,
				},
			},
		},
		cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
	},
}
