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
							settings = {
								gopls = {
									hints = {
										rangeVariableTypes = true,
										parameterNames = true,
										constantValues = true,
										assignVariableTypes = true,
										compositeLiteralFields = true,
										compositeLiteralTypes = true,
										functionTypeParameters = true,
									},
								},
							},
						})
					end,
				},
			})
		end,
	},

	-- 强制 ts_ls 使用 Mason 自带的现代 TypeScript，忽略项目本地的老旧版本
	-- 用 vim.schedule 确保在 mason-lspconfig 的 automatic_enable 之后执行
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		config = function()
			local mason_ts = vim.fn.stdpath("data")
				.. "/mason/packages/typescript-language-server/node_modules/typescript/lib/tsserver.js"
			if vim.fn.filereadable(mason_ts) ~= 1 then
				return
			end
			vim.lsp.config("ts_ls", {
				init_options = {
					hostInfo = "neovim",
					tsserver = { path = mason_ts },
				},
			})
			-- 重启已有的 ts_ls 客户端
			for _, client in ipairs(vim.lsp.get_clients({ name = "ts_ls" })) do
				client:restart()
			end
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
