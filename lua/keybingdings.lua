-- leader
vim.g.mapleader = " "

-- basic
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set('i', 'oo', '<Esc>o')
vim.keymap.set('n', '<C-o>', '<C-o>zz')

-- motion
vim.keymap.set("n", "9", "<C-d>")
vim.keymap.set("n", "0", "<C-u>")

-- vscode
vim.keymap.set({ "n", "i" }, "<D-x>", "dd")

-- paste and yank
vim.keymap.set({ "n" }, "<D-v>", '"+p<CR>')
vim.keymap.set("!", "<D-v>", "<C-R>+")
vim.keymap.set("t", "<D-v>", "<C-R>+")
vim.keymap.set("v", "<D-v>", "<C-R>+")

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.builtin, {})
vim.keymap.set('n', 'q', builtin.oldfiles, {})
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
