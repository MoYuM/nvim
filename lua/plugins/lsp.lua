return {
	"williamboman/mason.nvim",

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		event = "lspattach",
		opts = {
			ensure_installed = {
				"stylua",
				"prettier",
			},
		},
	},

	-- mason 配合 lsp
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"cssls",
					"tailwindcss",
				},
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
						})
					end,
					["cssls"] = function()
						require("lspconfig").cssls.setup({
							capabilities = capabilities,
						})
					end,
					["lua_ls"] = function()
						require("lspconfig").lua_ls.setup({
							settings = {
								lua = {
									diagnostics = {
										globals = { "vim" },
									},
								},
							},
						})
					end,
					["tailwindcss"] = function()
						require("lspconfig").tailwindcss.setup({
							capabilities = capabilities,
						})
					end,
					["volar"] = function()
						require("lspconfig").volar.setup({
							capabilities = capabilities,
						})
					end,
					["unocss"] = function()
						require("lspconfig").unocss.setup({
							capabilities = capabilities,
						})
					end,
				},
			})
		end,
	},

	-- 右下角的 lsp 状态信息
	{
		"j-hui/fidget.nvim",
		event = "lspattach",
		tag = "legacy",
		opts = {},
	},

	-- 基于 lsp 的重命名
	{
		"smjonas/inc-rename.nvim",
		opts = {},
		keys = {
			"<leader>rn",
		},
	},

	-- 开箱即用的 lsp 功能
	{
		"glepnir/lspsaga.nvim",
		event = "lspattach",
		config = function()
			require("lspsaga").setup({
				beacon = {
					enable = true,
					frequency = 7,
				},
				ui = {
					code_action = "",
				},
				symbol_in_winbar = {
					enable = false,
				},
			})
		end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},

	-- lua 开发, neovim 开发
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
	{ -- optional completion source for require statements and module annotations
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0, -- set group index to 0 to skip loading LuaLS completions
			})
		end,
	},

	-- 更好的代码错误提示
	{
		"dmmulroy/ts-error-translator.nvim",
		event = "lspattach",
		opts = {},
	},
}
