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

  -- 显示函数的引用数量
	{
		"Wansmer/symbol-usage.nvim",
		event = "BufReadPre", -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
		config = function()
			local function h(name)
				return vim.api.nvim_get_hl(0, { name = name })
			end

			-- hl-groups can have any name
			vim.api.nvim_set_hl(0, "SymbolUsageRounding", { fg = h("CursorLine").bg, italic = true })
			vim.api.nvim_set_hl(
				0,
				"SymbolUsageContent",
				{ bg = h("CursorLine").bg, fg = h("Comment").fg, italic = true }
			)
			vim.api.nvim_set_hl(0, "SymbolUsageRef", { fg = h("Function").fg, bg = h("CursorLine").bg, italic = true })
			vim.api.nvim_set_hl(0, "SymbolUsageDef", { fg = h("Type").fg, bg = h("CursorLine").bg, italic = true })
			vim.api.nvim_set_hl(0, "SymbolUsageImpl", { fg = h("@keyword").fg, bg = h("CursorLine").bg, italic = true })

			local function text_format(symbol)
				local res = {}

				local round_start = { "", "SymbolUsageRounding" }
				local round_end = { "", "SymbolUsageRounding" }

				if symbol.references then
					local usage = symbol.references <= 1 and "usage" or "usages"
					local num = symbol.references == 0 and "no" or symbol.references
					table.insert(res, round_start)
					table.insert(res, { "󰌹 ", "SymbolUsageRef" })
					table.insert(res, { ("%s %s"):format(num, usage), "SymbolUsageContent" })
					table.insert(res, round_end)
				end

				if symbol.definition then
					if #res > 0 then
						table.insert(res, { " ", "NonText" })
					end
					table.insert(res, round_start)
					table.insert(res, { "󰳽 ", "SymbolUsageDef" })
					table.insert(res, { symbol.definition .. " defs", "SymbolUsageContent" })
					table.insert(res, round_end)
				end

				if symbol.implementation then
					if #res > 0 then
						table.insert(res, { " ", "NonText" })
					end
					table.insert(res, round_start)
					table.insert(res, { "󰡱 ", "SymbolUsageImpl" })
					table.insert(res, { symbol.implementation .. " impls", "SymbolUsageContent" })
					table.insert(res, round_end)
				end

				return res
			end

			require("symbol-usage").setup({
				text_format = text_format,
			})
		end,
	},
}
