vim.g.mapleader = " "

vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', '<leader>', '<Plug>(easymotion-prefix)', { desc = '设置 easymotion 的前缀'})

-- ctrl space
vim.keymap.set('n', '1', ':CtrlSpace B <Enter>')

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-p>', builtin.git_files, {})
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
