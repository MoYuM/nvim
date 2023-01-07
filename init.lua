require('keybingdings')

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'bling/vim-airline'
Plug('junegunn/fzf', {
	['do'] = function()
		vim.call('fzf#install')
		vim.call('fzf#run', { source = 'git ls-files' })
	end
})
Plug 'junegunn/fzf.vim'Plug 'vim-ctrlspace/vim-ctrlspace'

vim.call('plug#end')

