require('keybingdings')

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'bling/vim-airline'
Plug 'junegunn/fzf'
Plug 'vim-ctrlspace/vim-ctrlspace'

vim.call('plug#end')
