local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    config = function(_, opts)
      opts.sources[#opts.sources + 1] = {  name = "hrsh7th/cmp-cmdline" }
      require("cmp").setup(opts)
      require "custom.configs.cmp"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = {
      view = {
        adaptive_size = true,
        float = {
          enable = true,
        },
      },
    },
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false,
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }

  {
    "rmagatti/auto-session",
    opts = {},
    lazy = false,
  },

  {
    "Pocco81/auto-save.nvim",
    opts = {
      enabled = true,
    },
    lazy = false,
  },

  {
    "fedepujol/move.nvim",
    lazy = false,
  },

  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    lazy = false,
  },

  {
		"dgagn/diagflow.nvim",
		opts = {},
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
		"wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {},
    lazy = false,
	},

  {
		"ggandor/leap.nvim",
    lazy = false,
		config = function()
			require("leap").add_default_mappings()
		end,
	},

  {
    "smartpde/telescope-recent-files",
    lazy = false
  },

  { "kylechui/nvim-surround", lazy = false },

  {
    "wellle/targets.vim",
    lazy = false,
  },

  {
    "rrethy/vim-illuminate",
    lazy = false,
  },

  {
    "windwp/nvim-ts-autotag",
    lazy = false,
  }
}

return plugins
