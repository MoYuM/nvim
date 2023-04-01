local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = 'float' })

function Lazygit_toggle()
  lazygit:toggle()
end


-- leader
vim.g.mapleader = " "

-- basic
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "oo", "<Esc>o")
vim.keymap.set("n", "<C-o>", "<C-o>zz")

-- vscode
vim.keymap.set({ "n", "i" }, "<D-x>", "dd")

-- paste and yank
vim.keymap.set({ "n" }, "<C-v>", '"+p<CR>')
vim.keymap.set({ "n", "v" }, "<C-c>", '"+y')

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.builtin, {})
vim.keymap.set("n", "<leader>o", builtin.oldfiles, {})

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

-- lazygit terminal
vim.keymap.set("n", "<leader>g", "<cmd>lua Lazygit_toggle()<CR>", {noremap = true, silent = true})
