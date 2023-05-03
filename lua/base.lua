local function has(x)
  return vim.fn.has(x) == 1
end

local is_mac = has "macunix"

-- clipboard
if is_mac then
  vim.opt.clipboard:append("unnamedplus")
end

vim.opt.scrolloff = 8
