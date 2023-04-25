require('lazy').setup({
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "windwp/nvim-ts-autotag",
  'fedepujol/move.nvim',

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        auto_refresh = true,
      })
    end,
  },

  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "1", "<cmd>:NvimTreeToggle<cr>", desc = "NvimTree" },
    },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
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
    end
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/nvim-cmp"
    },
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
      })
      -- setup cmp for autopairs
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "tsserver" },
      }
      require("mason-lspconfig").setup_handlers({
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup({
            settings = {
              Lua = {
                diagnostics = {
                  -- Get the language server to recognize the `vim` global
                  globals = { "vim", "hs" },
                },
              },
            },
          })
        end,
      })
    end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup({
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
      })
    end,
  },

  {
    "Pocco81/auto-save.nvim",
    config = function()
      require('auto-save').setup()
    end
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
    config = function()
      require('cmpsetup')
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      vim.opt.list = true
      require("indent_blankline").setup {
          space_char_blankline = " ",
          show_current_context = true,
      }
    end
  },

  {
    "kdheepak/lazygit.nvim",
    keys = {
      { "<leader>gg", "<cmd>:LazyGit<cr>", desc = "LazyGit" },
    }
  },

  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>ff", "<cmd>:Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>lg", "<cmd>:Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>o", "<cmd>:Telescope buffers<cr>", desc = "Buffers" },
    }
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
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

      local git_blame = require('gitblame')
      vim.g.gitblame_date_format = '%r'
      vim.g.gitblame_message_template = 'ﰗ <summary> - שּ <author> - ﮮ <date>'
      vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text

      require("lualine").setup({
        options = {
          theme = "tokyonight",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", },
          lualine_x = { "diff" },
          lualine_y = { "diagnostics" },
          lualine_z = { moyum },
          lualine_c = {
            { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }
          }
        },
      })
    end
  },

  {
     "rmagatti/auto-session",
     config = function()
       require("auto-session").setup({
         log_level = "error",
         auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
       })
     end,
  },

  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("Comment").setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end,
  },

  {
    "folke/trouble.nvim",
    config = function()
       require("trouble").setup()
    end
  },

  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
        require("lspsaga").setup({})
    end,
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      {"nvim-treesitter/nvim-treesitter"}
    }
  },

  {
   "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  {
    "phaazon/hop.nvim",
    keys = {
      { '<leader>s', '<cmd>:HopChar1<cr>', desc = 'Hop' }
    },
    branck = 'v2',
    config = function ()
      require('hop').setup()
    end
  }
 })
