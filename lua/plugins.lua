require("lazy").setup({
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",
	"windwp/nvim-ts-autotag",
	"fedepujol/move.nvim",
	"rrethy/vim-illuminate",
	"kdheepak/lazygit.nvim",
	"smartpde/telescope-recent-files",
	"onsails/lspkind.nvim",
	"tpope/vim-fugitive",
	"pocco81/auto-save.nvim",
	"sbdchd/neoformat",
	"jose-elias-alvarez/typescript.nvim",
	"ray-x/lsp_signature.nvim",
	"wellle/targets.vim",
	-- Lazy
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			position = "right",
			mode = "lsp_references",
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"gbprod/yanky.nvim",
		opts = {},
	},

	{
		"dgagn/diagflow.nvim",
		opts = {},
	},

	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
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

	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		opts = {},
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
			require("scrollbar.handlers.gitsigns").setup()
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-live-grep-args.nvim",
			"gbprod/yanky.nvim",
		},
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
			require("telescope").load_extension("yank_history")
		end,
	},

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

	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				transparent = true,
				on_highlights = function(hl, c)
					local prompt = "#2d3149"
					hl.TelescopeNormal = {
						bg = c.bg_dark,
						fg = c.fg_dark,
					}
					hl.TelescopeBorder = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopePromptNormal = {
						bg = prompt,
					}
					hl.TelescopePromptBorder = {
						bg = prompt,
						fg = prompt,
					}
					hl.TelescopePromptTitle = {
						bg = prompt,
						fg = prompt,
					}
					hl.TelescopePreviewTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopeResultsTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
				end,
			})
			vim.cmd([[colorscheme tokyonight]])
		end,
	},

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

	{
		"windwp/nvim-autopairs",
		event = "insertenter",
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("nvim-autopairs").setup({
				check_ts = true,
			})
			-- setup cmp for autopairs
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
			"jose-elias-alvarez/typescript.nvim",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
					"cssls",
				},
				handlers = {
					function(server_name)
						-- don't setup tsserver, it's already setup by typescript-tool.nvim
						if not server_name == "tsserver" then
							require("lspconfig")[server_name].setup({
								capabilities = capabilities,
							})
						end
					end,
					["cssls"] = function()
						require("lspconfig").cssls.setup({
							capabilities = capabilities,
						})
					end,
					["lua_ls"] = function()
						require("lspconfig").lua_ls.setup({
							settings = {
								lua = {
									diagnostics = {
										globals = { "vim" },
									},
								},
							},
						})
					end,
				},
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":tsupdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"typescript",
					"tsx",
					"javascript",
					"markdown",
					"markdown_inline",
				},
				highlight = {
					enable = true,
					use_languagetree = true,
				},
				autotag = {
					enable = true,
				},
			})
		end,
	},
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
	},

	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	config = function()
	-- 		vim.opt.list = true
	-- 		require("indent_blankline").setup({
	-- 			space_char_blankline = " ",
	-- 			show_current_context = true,
 --        scope = { enabled = true },
	-- 		})
	-- 	end,
	-- },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   main = "ibl",
  --   opts = {
  --     indent = { char = "" },
  --     scope = {
  --       enabled = true,
  --       show_start = false,
  --       char = "·",
  --     }
  --   },
  -- },

	{
		"max397574/better-escape.nvim",
		event = "insertenter",
		config = function()
			require("better_escape").setup({
				mapping = { "jj" },
			})
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"f-person/git-blame.nvim",
		},
		config = function()
			local ui = require("ui")
			local function moyum()
				return [[moyum]]
			end

			local git_blame = require("gitblame")
			vim.g.gitblame_date_format = "%r"
			vim.g.gitblame_message_template = "󰙊 <summary> • <date> • <author>"
			vim.g.gitblame_display_virtual_text = 0 -- disable virtual text
			vim.g.gitblame_date_format = "%r"

			require("lualine").setup({
				options = {
					theme = "tokyonight",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = {
						{
							"mode",
							fmt = function(str)
								return ui.icons.Vim .. str
							end,
						},
					},
					lualine_b = {
						{
							"branch",
							color = {
								fg = ui.colors.orange,
								gui = "bold",
							},
						},
					},
					lualine_x = {
						{
							"diagnostics",
							symbols = {
								error = ui.icons.Error,
								warn = ui.icons.Warn,
								hint = ui.icons.Hint,
								info = ui.icons.Info,
							},
						},
					},
					lualine_y = {
						{
							"diff",
						},
					},
					lualine_z = { moyum },
					lualine_c = {
						{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
					},
				},
			})
		end,
	},

	{
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/projects", "~/downloads", "/" },
			})
		end,
	},

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
	},

	{
		"glepnir/lspsaga.nvim",
		event = "lspattach",
		config = function()
			require("lspsaga").setup({
				beacon = {
					enable = true,
					frequency = 7,
				},
				ui = {
					code_action = "",
				},
				symbol_in_winbar = {
					enable = false,
				},
			})
		end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},

	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	},

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			autochdir = true,
		},
	},

	{
		"wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({ --[[ your config ]]
			})
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			require("ufo").setup()
		end,
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	{
		"karb94/neoscroll.nvim",
		opts = {
			hide_cursor = false,
			easing_function = "sine",
		},
	},
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

	{ "folke/neodev.nvim", opts = {} },

  {
    "norcalli/nvim-colorizer.lua",
    opts = {},
    config = function()
      require'colorizer'.setup()
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },

  {
    "smjonas/inc-rename.nvim",
    opts = {},
  },

  { 
    "danymat/neogen", 
    dependencies = "nvim-treesitter/nvim-treesitter", 
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*" 
  },

  -- Go forward/backward with square brackets
	{
		"echasnovski/mini.bracketed",
		event = "BufReadPost",
		config = function()
			local bracketed = require("mini.bracketed")
			bracketed.setup({
				file = { suffix = "" },
				window = { suffix = "" },
				quickfix = { suffix = "" },
				yank = { suffix = "" },
				treesitter = { suffix = "n" },
        oldfile = { suffix = "" }
			})
		end,
	},
})
