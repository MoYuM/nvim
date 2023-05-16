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

  -- remember window size
  vim.g.neovide_remember_window_size = true
end
