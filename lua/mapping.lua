local wk = require("which-key")

wk.add({
	{ "3", "#", desc = "find next word under cursor" },
	-- { "99", "<cmd>lua require('mo').moc()<cr>", desc = "test" },
	{ "9", "^", desc = "return first char of the line" },
	{ "4", "$", desc = "return last char of the line" },
	{ "<esc>", ":noh<cr>", desc = "no highlight" },
	{ "<leader><leader>", "<cmd>Telescope commands<cr>", desc = "Find Commands" },
	{ "<leader>a", "ggVG", desc = "Select all" },
	{ "<leader>ca", "<cmd>:lua vim.lsp.buf.code_action()<CR>", desc = "code action" },
	{ "<leader>k", "<cmd>:lua vim.diagnostic.open_float()<CR>", desc = "show line diagnostics" },
	{ "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
	{ "<leader>g", "<cmd>LazyGit<CR>", desc = "git" },
	{
		"<leader>lg",
		"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
		desc = "Live Grep",
	},
	{ "<leader>mc", "<cmd>MCunderCursor<cr>", desc = "MCunderCursor" },
	{ "<leader>o", "<cmd>lua require('telescope').extensions.recent_files.pick()<cr>", desc = "Recent files" },
	{ "<leader>rl", ":LspRestart<cr>", desc = "Restart lsp server" },
	{
		"<leader>rn",
		function()
			return ":IncRename " .. vim.fn.expand("<cword>")
		end,
		desc = "rename",
		expr = true,
	},
	{ "<leader>t", ":ToggleTerm<CR>", desc = "toggle terminal float" },
	{ "=", ":lua require('conform').format()<cr>", desc = "format" },
	{ "\\", ":Telescope resume<cr>", desc = "resume telescope" },
	{ "hd", "<cmd>:lua vim.lsp.buf.hover()<CR>", desc = "hover doc" },
	{ "<leader>s", "<cmd>wall<CR>", desc = "save all" },
	{ "<leader>S", ":ASToggle<CR>", desc = "toggle auto save" },
})

wk.add({
	{ "<C-j>", ":MoveLine(1)<CR>", desc = "move line down" },
	{ "<C-k>", ":MoveLine(-1)<CR>", desc = "move line up" },
	{
		mode = { "v" },
		{ "<C-j>", ":MoveBlock(1)<CR>", desc = "move block down" },
		{ "<C-k>", ":MoveBlock(-1)<CR>", desc = "move block up" },
	},
})

wk.add({
	{ "<esc><esc>", "<C-\\><C-n>", desc = "quit term mode", mode = "t" },
})

-- yank
wk.add({
	{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" } },
	{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" } },
	{ "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" } },
	{ "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" } },
	{ "<C-p>", "<Plug>(YankyPreviousEntry)", mode = "n" },
	{ "<C-n>", "<Plug>(YankyNextEntry)", mode = "n" },
})
