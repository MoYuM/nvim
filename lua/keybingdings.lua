vim.g.mapleader = " "

vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', '<leader>', '<Plug>(easymotion-prefix)', { desc = '设置 easymotion 的前缀'})

-- fzf
vim.keymap.set('n', '<c-p>', ':GFiles<Enter>')

-- ctrl space
vim.keymap.set('n', '1', ':CtrlSpace B <Enter>')
