require('lazy').setup({
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "windwp/nvim-ts-autotag",
  'fedepujol/move.nvim',
  "RRethy/vim-illuminate",
  "pocco81/auto-save.nvim",
  "kdheepak/lazygit.nvim",
  "smartpde/telescope-recent-files",

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    config = function()
      require("telescope").setup {
        defaults = {
        },
        pickers = {
          find_files = {
            theme = "dropdown",
          },
        },
        extensions = {
          recent_files = {
            only_cwd = true,
            theme = "dropdown",
          },
          live_grep_args = {
            auto_quoting = false,
            theme = "dropdown"
          }
        }
      }
      require("telescope").load_extension("recent_files")
      require("telescope").load_extension("live_grep_args")
    end
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
        },
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
      })
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "1", "<cmd>:NvimTreeFindFileToggle<cr>", desc = "NvimTree" },
    },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
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
        autotag = {
          enable = true,
        }
      })
    end,
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
      require('configs.cmp')
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
      vim.g.gitblame_message_template = '󰙊 <summary>'
      vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text

      require("lualine").setup({
        options = {
          theme = "tokyonight",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = {
            {
              'mode',
              fmt = function(str)
                return ' ' .. str
              end
            }
          },
          lualine_b = { 'branch', 'diagnostics'},
          lualine_x = { "diff" },
          lualine_y = { "filename" },
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
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
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
        }
      })
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" }
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
    branck = 'v2',
    config = function ()
      require('hop').setup()
    end
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
    "nvim-pack/nvim-spectre",
    config = function()
      require('spectre').setup({
        mapping={
          ['run_replace'] = {
            map = "<leader><cr>",
            cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
            desc = "replace all"
          },
          ['run_current_replace'] = {
            map = "<cr>",
            cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
            desc = "replace current line"
          },
        }
      })
    end,
  },

  'nvim-treesitter/nvim-treesitter-context',

  {
    "ray-x/lsp_signature.nvim",
    config = function ()
      require("lsp_signature").setup({})
    end
  },

  {
    "j-hui/fidget.nvim",
    config = function ()
      require("fidget").setup({})
    end
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
  }
})
