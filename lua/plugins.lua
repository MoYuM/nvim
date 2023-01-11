return require("packer").startup({
	function(use)
		-- Packer can manage itself
		use("wbthomason/packer.nvim")
		use("nvim-lua/plenary.nvim")

		-- colorscheme
		use("folke/tokyonight.nvim")

		-- fuzzy find
		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
			-- or                            , branch = '0.1.x',
			requires = { { "nvim-lua/plenary.nvim" } },
		})

		-- motion
		use({
			"phaazon/hop.nvim",
			branch = "v2", -- optional but strongly recommended
			config = function()
				-- you can configure Hop the way you like here; see :h hop-config
				require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
			end,
		})

		-- session
		use({
			"rmagatti/auto-session",
			config = function()
				require("auto-session").setup({
					log_level = "error",
					auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
				})
			end,
		})

		-- git-blame
		use("f-person/git-blame.nvim")

		-- auto save
		use({
			"Pocco81/auto-save.nvim",
			config = function()
				require("auto-save").setup({
					enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
					execution_message = {
						message = function() -- message to print on save
							return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
						end,
						dim = 0.18, -- dim the color of `message`
						cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
					},
					trigger_events = { "InsertLeave", "TextChanged" }, -- vim events that trigger auto-save. See :h events
					-- function that determines whether to save the current buffer or not
					-- return true: if buffer is ok to be saved
					-- return false: if it's not ok to be saved
					condition = function(buf)
						local fn = vim.fn
						local utils = require("auto-save.utils.data")

						if
							fn.getbufvar(buf, "&modifiable") == 1
							and utils.not_in(fn.getbufvar(buf, "&filetype"), {})
						then
							return true -- met condition(s), can save
						end
						return false -- can't save
					end,
					write_all_buffers = false, -- write all buffers when the current one meets `condition`
					debounce_delay = 135, -- saves the file at most every `debounce_delay` milliseconds
					callbacks = { -- functions to be executed at different intervals
						enabling = nil, -- ran when enabling auto-save
						disabling = nil, -- ran when disabling auto-save
						before_asserting_save = nil, -- ran before checking `condition`
						before_saving = function()
							vim.call("Neoformat")
						end, -- ran before doing the actual save
						after_saving = nil, -- ran after doing the actual save
					},
				})
			end,
		})

		-- comment
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		})

		-- explore
		use({
			"nvim-tree/nvim-tree.lua",
			requires = {
				"nvim-tree/nvim-web-devicons", -- optional, for file icons
			},
			tag = "nightly", -- optional, updated every week. (see issue #1193)
		})

		-- format
		use("sbdchd/neoformat")

		-- lsp
		use({
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		})

		-- diagnostics
		use({
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("trouble").setup({
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
				})
			end,
		})

		-- cmp
		use("neovim/nvim-lspconfig")
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-cmdline")
		use("hrsh7th/nvim-cmp")
		use("L3MON4D3/LuaSnip")
		use("saadparwaiz1/cmp_luasnip")

		-- auto pairs
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup({})
			end,
		})

		-- lspsaga
		use({
			"glepnir/lspsaga.nvim",
			branch = "main",
		})

		-- gitsigns
		use({
			"lewis6991/gitsigns.nvim",
			config = function()
				require("gitsigns").setup()
			end,
		})
	end,

	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
