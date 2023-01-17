vim.cmd('colorscheme tokyonight')
vim.cmd[[
  colorscheme tokyonight
  set number
]]

vim.o.signcolumn = 'yes';

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
