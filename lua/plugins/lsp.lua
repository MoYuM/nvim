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

	-- Mason 配合 lsp
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
					"ts_ls",
				},
				handlers = {
					function()
						require("lspconfig").cssls.setup({
							capabilities = capabilities,
						})

						require("lspconfig").ts_ls.setup({
							capabilities = capabilities,
						})

						require("lspconfig").lua_ls.setup({
							settings = {
								lua = {
									diagnostics = {
										globals = { "vim" },
									},
								},
							},
						})

						require("lspconfig").tailwindcss.setup({
							capabilities = capabilities,
						})

						require("lspconfig").volar.setup({
							capabilities = capabilities,
						})

						require("lspconfig").unocss.setup({
							capabilities = capabilities,
						})

            require("lspconfig").gopls.setup({
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
	},

	-- 基于 lsp 的重命名
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	},

	-- lua 开发, Neovim 开发
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

	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
}
