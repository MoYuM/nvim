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
	"nvim-treesitter/nvim-treesitter-context",
	"pocco81/auto-save.nvim",
	"sbdchd/neoformat",
	"jose-elias-alvarez/typescript.nvim",
	"kylechui/nvim-surround",
	"ray-x/lsp_signature.nvim",
  "wellle/targets.vim",
  -- Lazy

  {
    "gbprod/yanky.nvim",
    opts = {}
  },
  
  {
    'dgagn/diagflow.nvim',
    opts = {}
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
      theme = 'tokyonight',
    }
  },

  {
    "j-hui/fidget.nvim",
    tag = 'legacy',
    pin = true,
    config = function ()
      require('fidget').setup({})
    end
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function ()
      require('gitsigns').setup({})
    end
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
            height = 0.9
          }
        },
        pickers = {
        },
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
			"jose-elias-alvarez/typescript.nvim"
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
            if (not server_name == "tsserver") then
              require("lspconfig")[server_name].setup({
                capabilities = capabilities,
              })
            end
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
				indent = { enable = true },
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

	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			vim.opt.list = true
			require("indent_blankline").setup({
				space_char_blankline = " ",
				show_current_context = true,
			})
		end,
	},

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
								return " " .. str
							end,
						},
					},
					lualine_b = { "branch", "diagnostics" },
					lualine_x = { "diff" },
					lualine_y = {
						{
							"filename",
							path = 4,
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
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Flash Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },

    },
  },
})
