local alpha = function()
  return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end

if vim.g.neovide then

  -- font
  vim.o.guifont = "JetBrainsMono Nerd Font:h18"
  vim.opt.linespace = 2

  -- neovide_background
  vim.g.neovide_transparency = 0.0
  vim.g.transparency = 0.8
  vim.g.neovide_background_color = "#0f1117" .. alpha()

  vim.g.neovide_remember_window_size = true

  -- disable netrw
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

end
