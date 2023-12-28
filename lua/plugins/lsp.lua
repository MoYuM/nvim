return {
	-- 专门对 tsserver 的优化
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},

	"williamboman/mason.nvim",

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
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
						-- don't setup tsserver, it's already setup by typescript-tool.nvim
						if not server_name == "tsserver" then
							require("lspconfig")[server_name].setup({
								capabilities = capabilities,
							})
						end
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
          ["volar"] = function ()
						require("lspconfig").volar.setup({
							capabilities = capabilities,
						})
          end
				},
			})
		end,
	},

	-- 右下角的 lsp 状态信息
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		opts = {},
	},

	-- 基于 lsp 的重命名
	{
		"smjonas/inc-rename.nvim",
		opts = {},
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
	{ "folke/neodev.nvim", opts = {} },
}
