---@diagnostic disable: missing-fields
return {
  "windwp/nvim-ts-autotag",          -- 自动补全标签
  "fedepujol/move.nvim",             -- 快速移动代码
  "rrethy/vim-illuminate",           -- 高亮代码中其他和当前选中的一样的单词
  "smartpde/telescope-recent-files", -- 最近文件
  "pocco81/auto-save.nvim",          -- 自动保存
  -- "sbdchd/neoformat", -- format
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
  "wellle/targets.vim", -- 快捷选中更多的 target
  -- 更明显的 TODO 注释
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-live-grep-args.nvim",
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
  -- TODO 这个在有些情况不太合理
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
  },

  -- 更好的 jj 退出
  {
    "max397574/better-escape.nvim",
    event = "insertenter",
    config = function()
      require("better_escape").setup({
        mapping = { "jj" },
      })
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
    config = function()
      require("treesj").setup({ --[[ your config ]]
      })
    end,
  },

  -- 折叠
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      require("ufo").setup()
    end,
  },

  -- 快速跳转
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
}
