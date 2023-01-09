vim.g.coq_settings = {
	auto_start = 'shut-up'
}

require('keybingdings')
require('plugins')
require('coq')

-- colorschema
vim.cmd[[colorscheme tokyonight]]

-- neovide
-- vim.cmd [[
-- let g:neovide_floating_blur_amount_x = 2.0
-- let g:neovide_floating_blur_amount_y = 2.0
-- ]]
--

-- vim
vim.cmd[[
set number
set nowrap
set autoindent expandtab tabstop=2 shiftwidth=2
]]

-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


-- format
vim.g.neoformat_basic_format_align = 1
vim.g.neoformat_basic_format_retab = 1
vim.g.neoformat_basic_format_trim = 1
