vim.cmd[[
  colorscheme tokyonight
  set number
  set signcolumn=yes
]]

-- Helper function for transparency formatting
local alpha = function()
  return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end

if (vim.g.neovide) then
  vim.g.neovide_transparency = 0.0
  vim.g.transparency = 0.8
  vim.g.neovide_background_color = "#0f1117" .. alpha()
  vim.g.neovide_floating_blur_amount_x = 4.0
  vim.g.neovide_floating_blur_amount_y = 4.0
  vim.g.neovide_remember_window_size = true
end

vim.o.guifont = "CaskaydiaCove Nerd Font Mono:h16"
vim.opt.linespace = 2


require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
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
