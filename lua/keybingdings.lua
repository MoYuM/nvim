-- leader
vim.g.mapleader = " "

vim.keymap.set("i", "jj", "<Esc>")


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
vim.keymap.set("n", "1", ":NvimTreeToggle<Enter>")
