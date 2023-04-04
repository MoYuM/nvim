local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup({
  function(use)
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use("folke/tokyonight.nvim")
    use("f-person/git-blame.nvim")
    use("sbdchd/neoformat")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("windwp/nvim-ts-autotag")
    use("github/copilot.vim")
    use("tpope/vim-fugitive")
    use({
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    })
    
    -- better scroll
    use {
      'declancm/cinnamon.nvim',
      config = function() require('cinnamon').setup() end
    }

    use({
      "nvim-telescope/telescope.nvim",
      tag = "0.1.0",
      requires = { { "nvim-lua/plenary.nvim" } },
    })

    use({
      "phaazon/hop.nvim",
      branch = "v2", -- optional but strongly recommended
      config = function()
        require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
      end,
    })

    use({
      "rmagatti/auto-session",
      config = function()
        require("auto-session").setup({
          log_level = "error",
          auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        })
      end,
    })
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

    -- diagnostics
    use({
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
    })

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

    -- treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
      end,
    })

    -- statuts line
    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    use {
      "max397574/better-escape.nvim",
      config = function()
        require("better_escape").setup()
      end,
    }

    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-j>]],
        direction = 'float'
      })
    end}

    use {
      "yamatsum/nvim-cursorline",
      config = function()
        require('nvim-cursorline').setup {
          cursorline = {
            enable = true,
            timeout = 0,
            number = true,
          },
          cursorword = {
            enable = true,
            min_length = 3,
            hl = { underline = true },
          }
        } 
      end,
    }

    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    if packer_bootstrap then
      require('packer').sync()
    end
  end,

  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})
