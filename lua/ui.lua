vim.cmd[[
  colorscheme tokyonight
  set number
  set signcolumn=yes
]]

vim.o.guifont = "CaskaydiaCove Nerd Font Mono"

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
-- lualine
-- https://github.com/nvim-lualine/lualine.nvim

local function moyum()
  return [[moyum]]
end

require("lualine").setup({
	options = {
		theme = "horizon",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", },
		lualine_c = { "filename" },
		lualine_x = { "diff" },
		lualine_y = { "diagnostics" },
		lualine_z = { moyum },
	},
})
