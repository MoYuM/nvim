-- leader
vim.g.mapleader = " "

vim.keymap.set('i', 'jj', '<Esc>')


-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-p>', builtin.git_files, {})


-- hop
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('n', 'F', hop.hint_char1, {remap=true})
vim.keymap.set('n', 'f', function()
  hop.hint_char1({current_line_only=true})
end, {remap=true})

-- nvim-tree
vim.keymap.set('n', '1', ':NvimTreeToggle<Enter>')
