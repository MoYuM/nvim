vim.g.coq_settings = {
auto_start = 'shut-up'
}

require('keybingdings')
require('plugins')
require('coq')


-- colorschema
-- vim.o.background = 'dark'
-- local colorscheme = "NeoSolarized"
-- dlocal status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
-- 	vim.notify("colorscheme " .. colorscheme .. " not Found")
-- 	return
-- end



-- neovide
-- vim.cmd [[
-- let g:neovide_floating_blur_amount_x = 2.0
-- let g:neovide_floating_blur_amount_y = 2.0
-- ]]
