-- leader
vim.g.mapleader = " "

-- mode
vim.keymap.set("i", "jj", "<Esc>")

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
vim.keymap.set("n", "<D-p>", builtin.builtin, {})
vim.keymap.set('n', 'q', builtin.oldfiles, {})
-- hop
local hop = require("hop")
vim.keymap.set("n", "<leader>s", hop.hint_char1, { remap = true })

-- nvim-tree
vim.keymap.set("n", "1", ":NvimTreeFocus<Enter>")

-- format
vim.keymap.set("n", "=", ":Neoformat<CR>")

-- trouble
vim.keymap.set("n", "2", ":TroubleToggle document_diagnostics<CR>")

-- lspsaga
vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
vim.keymap.set("n", "<D-k>", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
vim.keymap.set("n", "<D-j>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
vim.keymap.set("t", "<D-j>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
