local function has(x)
  return vim.fn.has(x) == 1
end

local is_mac = has "macunix"

-- clipboard
if is_mac then
  vim.opt.clipboard:append("unnamedplus")
end

vim.opt.scrolloff = 8

-- fold
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- disable editorconfig
vim.g.editorconfig = false
