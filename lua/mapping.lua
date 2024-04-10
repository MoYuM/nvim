local wk = require("which-key")

wk.register({
	-- normal
	["3"] = { "#", "find next word under cursor" },
	["\\"] = { ":Telescope resume<cr>", "resume telescope" },
	["<esc>"] = { ":noh<cr>", "no highlight" },
	["99"] = { "<cmd>lua require('mo').moc()<cr>", "test" },
	["="] = { ":lua require('conform').format()<cr>", "format" },
	["<leader>a"] = { "ggVG", "Select all" },
	["<leader><leader>"] = { "<cmd>Telescope commands<cr>", "Find Commands" },
  ["<leader>mc"] = { "<cmd>MCunderCursor<cr>", "MCunderCursor" },

	-- terminal
	["<leader>t"] = { ":ToggleTerm<CR>", "toggle terminal float" },

	-- lsp
	["gh"] = { "<cmd>Lspsaga lsp_finder<CR>", "lsp finder" },
	["gd"] = { "<cmd>Lspsaga peek_definition<CR>", "peek definition" },
	["hd"] = { "<cmd>Lspsaga hover_doc<CR>", "hover doc" },
	["d]"] = { ":Lspsaga diagnostic_jump_next<CR>", "jump to next diagnostics" },
	["d["] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "jump to prev diagnostics" },
	["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>", "code action" },
	["<leader>k"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", "show line diagnostics" },
	["<leader>K"] = { "<cmd>Lspsaga show_buf_diagnostics<CR>", "show buffer diagnostics" },
	["<leader>O"] = { "<cmd>Lspsaga outline<CR>", "show outline" },
	["<leader>rn"] = { ":IncRename ", "rename" },
	["<leader>rl"] = { ":LspRestart<cr>", "Restart lsp server" },

	-- move line
	["<C-j>"] = { ":MoveLine(1)<CR>", "move line down" },
	["<C-k>"] = { ":MoveLine(-1)<CR>", "move line up" },
	["<C-h>"] = { ":MoveHChar(-1)<CR>", "move char left" },
	["<C-l>"] = { ":MoveHChar(1)<CR>", "move char right" },

	["<leader>g"] = { "<cmd>LazyGit<CR>", "git" },
	["<leader>f"] = { "<cmd>Telescope find_files<cr>", "Find Files" },
	["<leader>lg"] = { "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", "Live Grep" },
	["<leader>o"] = { "<cmd>lua require('telescope').extensions.recent_files.pick()<cr>", "Recent files" },

	-- devdocs
	["<leader>d"] = { ":DevdocsOpenFloat<CR>", "toggle Devdoc" },
})

wk.register({
	["<C-j>"] = { ":MoveBlock(1)<CR>", "move block down" },
	["<C-k>"] = { ":MoveBlock(-1)<CR>", "move block up" },
	["<C-h>"] = { ":MoveHBlock(-1)<CR>", "move block left" },
	["<C-l>"] = { ":MoveHBlock(1)<CR>", "move block right" },
}, {
	mode = "v",
})

wk.register({
	["<esc><esc>"] = { "<C-\\><C-n>", "quit term mode" },
}, {
	mode = "t",
})
