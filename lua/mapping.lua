local wk = require("which-key")

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  vim.keymap.set(mode, lhs, rhs, opts or options)
end
-- leader
vim.g.mapleader = " "

-- go back
map("n", "-", "<C-o>")

-- replace
wk.register({
  ["r"] = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "search current word" },
  ["cr"] = { "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>", "search on current file" },
}, {
    prefix = "<leader>",
  })

wk.register({
  ["r"] = { "<esc><cmd>lua require('spectre').open_visual()<CR>", "search current word" },
  ["cr"] = { "<esc><cmd>lua require('spectre').open_file_search()<CR>", "search on current file" },
}, {
    mode = "v",
    prefix = "<leader>"
  })


wk.register({
  ["3"] = { "#", "find next word under cursor" },
  ["\\"] = { ":Telescope resume<cr>", "resume telescope" },
  ["0"] = {":wa<cr>", "sava all"}
})

-- lsp
wk.register({
  ["gh"] = { "<cmd>Lspsaga lsp_finder<CR>", "lsp finder" },
  ["gr"] = { "<cmd>Lspsaga rename<CR>", "rename" },
  ["gd"] = { "<cmd>Lspsaga peek_definition<CR>", "peek definition"},
  ["hd"] = { "<cmd>Lspsaga hover_doc<CR>", "hover doc"},
  ["d]"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "jump to next diagnostics"},
  ["d["] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "jump to prev diagnostics"},
})

-- move line
wk.register({
  ['<C-j>'] = {':MoveLine(1)<CR>', "move line downo"},
  ['<C-k>'] = {':MoveLine(-1)<CR>', "move line up"},
  ['<C-h>'] = {':MoveHChar(-1)<CR>', "move char left"},
  ['<C-l>'] = {':MoveHChar(1)<CR>', "move char right"},
})

wk.register({
  ['a'] = { "ggVG", "Select all" },
  ["ca"] = { "<cmd>Lspsaga code_action<CR>", "code action" },
  ["k"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", "show line diagnostics" },
  ["K"] = {"<cmd>Lspsaga show_buf_diagnostics<CR>", "show buffer diagnostics"},
  ["O"] = {"<cmd>Lspsaga outline<CR>", 'show outline'},
  ["gg"] = {"<cmd>LazyGit<CR>", "lazygit"},
  ["ff"] = { "<cmd>Telescope find_files<cr>", "Find Files" },
  ["lg"] = {"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", "Live Grep" },
  ["o"] = {"<cmd>lua require('telescope').extensions.recent_files.pick()<cr>", "Recent files" },
  ["sh"] = {"<cmd>Telescope search_history<cr>", "Buffers" },
  ["ch"] ={ "<cmd>Telescope command_history<cr>", "Buffers" },
  ["s"] = { "<cmd>HopChar1<cr>", "Hop" }
}, {
    prefix = '<leader>',
  })

wk.register({
  ['<C-j>'] = {':MoveBlock(1)<CR>', 'move block down'},
  ['<C-k>'] = {':MoveBlock(-1)<CR>', 'move block up'},
  ['<C-h>'] = {':MoveHBlock(-1)<CR>', 'move block left'},
  ['<C-l>'] = {':MoveHBlock(1)<CR>', 'move block right'},
}, {
    mode = 'v',
  })

-- toggle terminal
wk.register({
  ['<D-j>'] = {':ToggleTerm direction=float<CR>', 'toggle terminal float'},
}, {
    mode = 'n'
  })
wk.register({
  ['<esc>'] = {'<C-\\><C-n>', 'quit term mode'},
}, {
    mode = 't'
  })
