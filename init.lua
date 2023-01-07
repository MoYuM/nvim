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
Plug 'junegunn/fzf.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'icymind/neosolarized'

vim.call('plug#end')

-- ctrlspace
vim.g.CtrlSpaceSaveWorkspaceOnSwitch = 1
vim.g.CtrlSpaceSaveWorkspaceOnExit = 1

-- autocmd
-- vim.api.nvim_create_autocmd('VimEnter', { command = ':CtrlSpace b' })

-- colorschema
vim.o.background = 'dark'
local colorscheme = "NeoSolarized"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not Found")
	return
end
