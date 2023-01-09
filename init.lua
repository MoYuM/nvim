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
