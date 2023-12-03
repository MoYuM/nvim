local wk = require("which-key")

local map = function(mode, key, result, desc)
	vim.keymap.set(mode, key, result, { noremap = true, silent = true, desc = desc })
end

-- test
map("n", "99", "<cmd>lua require('mo').moc()<cr>", "test")

-- restart lsp server
map("n", "<leader>lr", ":LspRestart<cr>", "Restart lsp server")

-- format
map("n", "=", ":Neoformat<cr>", "Format")

-- rename
map("n", "<leader>rn", ":IncRename ")

wk.register({
	["3"] = { "#", "find next word under cursor" },
	["\\"] = { ":Telescope resume<cr>", "resume telescope" },
})

-- lsp
wk.register({
	["gh"] = { "<cmd>Lspsaga lsp_finder<CR>", "lsp finder" },
	["gd"] = { "<cmd>Lspsaga peek_definition<CR>", "peek definition" },
	["hd"] = { "<cmd>Lspsaga hover_doc<CR>", "hover doc" },
	["d]"] = { ":Lspsaga diagnostic_jump_next<CR>", "jump to next diagnostics" },
	["d["] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "jump to prev diagnostics" },
})

-- move line
wk.register({
	["<C-j>"] = { ":MoveLine(1)<CR>", "move line downo" },
	["<C-k>"] = { ":MoveLine(-1)<CR>", "move line up" },
	["<C-h>"] = { ":MoveHChar(-1)<CR>", "move char left" },
	["<C-l>"] = { ":MoveHChar(1)<CR>", "move char right" },
})

wk.register({
	["a"] = { "ggVG", "Select all" },
	["ca"] = { "<cmd>Lspsaga code_action<CR>", "code action" },
	["k"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", "show line diagnostics" },
	["K"] = { "<cmd>Lspsaga show_buf_diagnostics<CR>", "show buffer diagnostics" },
	["O"] = { "<cmd>Lspsaga outline<CR>", "show outline" },
	["g"] = { "<cmd>LazyGit<CR>", "lazygit" },
	["f"] = { "<cmd>Telescope find_files<cr>", "Find Files" },
	["<leader>"] = { "<cmd>Telescope commands<cr>", "Find Commands" },
	["l"] = { "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", "Live Grep" },
	["o"] = { "<cmd>lua require('telescope').extensions.recent_files.pick()<cr>", "Recent files" },
}, {
	prefix = "<leader>",
})

wk.register({
	["<C-j>"] = { ":MoveBlock(1)<CR>", "move block down" },
	["<C-k>"] = { ":MoveBlock(-1)<CR>", "move block up" },
	["<C-h>"] = { ":MoveHBlock(-1)<CR>", "move block left" },
	["<C-l>"] = { ":MoveHBlock(1)<CR>", "move block right" },
}, {
	mode = "v",
})

-- toggle terminal
wk.register({
	["<leader>t"] = { ":ToggleTerm<CR>", "toggle terminal float" },
}, {
	mode = { "n" },
})
wk.register({
	["<esc><esc>"] = { "<C-\\><C-n>", "quit term mode" },
}, {
	mode = "t",
})
