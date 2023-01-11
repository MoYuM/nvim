-- leader
vim.g.mapleader = " "

-- mode
vim.keymap.set("i", "jj", "<Esc>")

-- motion
vim.keymap.set('n', '9', '<C-d>')
vim.keymap.set('n', '0', '<C-u>')

-- vscode
vim.keymap.set({ 'n', 'i' }, '<D-x>', 'dd')

-- paste and yank
vim.keymap.set({ "n" }, "<D-v>", '"+p<CR>')
vim.keymap.set('!', '<D-v>', '<C-R>+')
vim.keymap.set('t', '<D-v>', '<C-R>+')
vim.keymap.set('v', '<D-v>', '<C-R>+')

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<D-p>", builtin.git_files, {})

-- hop
local hop = require("hop")
local directions = require("hop.hint").HintDirection
vim.keymap.set("n", "<leader>s", hop.hint_char1, { remap = true })

-- nvim-tree
vim.keymap.set("n", "1", ":NvimTreeFocus<Enter>")

-- format
vim.keymap.set('n', '=', ":Neoformat<CR>")

-- trouble
vim.keymap.set('n', '2', ':TroubleToggle document_diagnostics<CR>')
