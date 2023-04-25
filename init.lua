local opt = vim.opt

opt.expandtab = true
opt.shiftwidth = 2
--opt.smartindent = true
opt.tabstop = 2
--opt.softtabstop = 2

opt.number = true
opt.signcolumn = 'yes'

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("keybingdings")
require('plugins')
