-- leader
vim.g.mapleader = " "

-- basic
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<C-o>", "<C-o>zz")

-- paste and yank
-- vim.keymap.set({ "n" }, "<C-v>", '"+p<CR>')
-- vim.keymap.set({ "n", "v" }, "<C-c>", '"+y')

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.builtin, {})
vim.keymap.set("n", "<leader>o", "<cmd>lua require('telescope.builtin').oldfiles()<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>lg", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
vim.keymap.set("n", "<leader>gf", "<cmd>lua require('telescope.builtin').git_files()<CR>")

-- hop
local hop = require("hop")
vim.keymap.set("n", "<leader>s", hop.hint_char1, { remap = true })

-- nvim-tree
vim.keymap.set("n", "1", ":NvimTreeFindFileToggle<Enter>")

-- format
vim.keymap.set("n", "=", ":Neoformat<CR>")

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

-- ssr
vim.keymap.set({ "n", "x" }, "<leader>r", function() require("ssr").open() end)

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
