require('keybingdings')

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'easymotion/vim-easymotion'

vim.call('plug#end')
