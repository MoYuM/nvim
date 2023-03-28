require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "tsserver" },
})
require("mason-lspconfig").setup_handlers({
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup({
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim", "hs" },
					},
				},
			},
		})
	end,
})
