-- require("plugins")
-- require("ui")
-- require('postfix')
-- require('lsp')
-- require('tree')
-- require('cmpsetup')
-- require("lspsaga").setup({})
-- require("treesitter")
-- require("keybingdings")

-- -- vim
-- vim.cmd([[
-- set nowrap
-- set completeopt=menu,menuone,noselect
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost plugins.lua source <afile> | PackerCompile
-- augroup end
-- ]])

local opt = vim.opt

opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2


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
vim.g.mapleader = " " 

require('ui');
require('plugins')