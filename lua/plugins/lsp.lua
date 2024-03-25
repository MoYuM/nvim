return {
  "williamboman/mason.nvim",
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({})
    end,
  },
  {
    "ray-x/navigator.lua",
    dependencies = {
      { "ray-x/guihua.lua",     run = "cd lua/fzy && make" },
      { "neovim/nvim-lspconfig" },
    },
    config = function()
      require("navigator").setup({
        mason = true,
        lsp = {
          format_on_save = false,
        },
      })
    end,
  },

  -- 右下角的 lsp 状态信息
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    opts = {},
  },

  -- lua 开发, neovim 开发
  { "folke/neodev.nvim", opts = {} },

  -- 更好的代码错误提示
  {
    "dmmulroy/ts-error-translator.nvim",
    opts = {},
  },
}
