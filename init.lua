require('keybingdings')
require('plugins')


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

-- neovide
vim.cmd [[
let g:neovide_floating_blur_amount_x = 2.0
let g:neovide_floating_blur_amount_y = 2.0
]]
