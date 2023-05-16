local alpha = function()
  return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
end

if vim.g.neovide then

  -- suggest font
  -- JetBrainsMono Nerd Font
  -- CaskaydiaCove Nerd Font
  -- suggest size h18
  vim.o.guifont = "CaskaydiaCove Nerd Font:h18"

  -- neovide background transparency
  vim.g.neovide_transparency = 0.0
  vim.g.transparency = 0.8
  vim.g.neovide_background_color = "#0f1117" .. alpha()

  -- transparency floating windows
  vim.g.neovide_floating_blur_amount_x = 30.0
  vim.g.neovide_floating_blur_amount_y = 30.0
  vim.opt.winblend = 7
  vim.opt.pumblend = 5

  -- remember window
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_remember_window_position = true
end
