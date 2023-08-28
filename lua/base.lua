local opt = vim.opt
local ui = require("ui")

local function has(x)
  return vim.fn.has(x) == 1
end

local is_mac = has "macunix"

-- clipboard
if is_mac then
  vim.opt.clipboard:append("unnamedplus")
end

opt.scrolloff = 8

-- spell
vim.opt.spell = true
vim.opt.spelllang = "en,cjk"
vim.opt.spelloptions = "camel"

-- fold
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- disable editorconfig
vim.g.editorconfig = false

-- better auto session
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- indent
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

-- column
opt.number = true
opt.signcolumn = 'yes'

-- cursorline
opt.cursorline = true

opt.wrap = false

for type, icon in pairs(ui.icons) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

