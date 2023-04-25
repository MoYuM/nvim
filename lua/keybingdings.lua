-- leader
vim.g.mapleader = " "

-- basic
vim.keymap.set("n", "<C-o>", "<C-o>zz")

-- paste and yank
-- vim.keymap.set({ "n" }, "<C-v>", '"+p<CR>')
-- vim.keymap.set({ "n", "v" }, "<C-c>", '"+y')

-- hop
-- local hop = require("hop")
-- vim.keymap.set("n", "<leader>s", hop.hint_char1, { remap = true })

-- trouble
vim.keymap.set("n", "2", ":TroubleToggle document_diagnostics<CR>")

-- lspsaga
vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
vim.keymap.set("n", "hd", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- lazygit
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", {noremap = true, silent = true})

local opts = { noremap = true, silent = true }
-- Normal-mode commands
vim.keymap.set('n', '<C-j>', ':MoveLine(1)<CR>', opts)
vim.keymap.set('n', '<C-k>', ':MoveLine(-1)<CR>', opts)
vim.keymap.set('n', '<C-h>', ':MoveHChar(-1)<CR>', opts)
vim.keymap.set('n', '<C-l>', ':MoveHChar(1)<CR>', opts)

-- Visual-mode commands
vim.keymap.set('v', '<C-j>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<C-k>', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', '<C-h>', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', '<C-l>', ':MoveHBlock(1)<CR>', opts)
