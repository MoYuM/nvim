local function ts_code_action(content)
	vim.lsp.buf.code_action({
		apply = true,
		context = {
			only = { content },
			diagnostics = {},
		},
	})
end

local function create_ts_command(name, content, description)
	vim.api.nvim_create_user_command(name, function()
		ts_code_action(content)
	end, { desc = description })
end

create_ts_command("RemoveUnused", "source.removeUnused.ts", "Remove unused code in TypeScript")
create_ts_command("FixAll", "source.fixAll.ts", "Fix all issues in TypeScript")
create_ts_command("AddMissingImports", "source.addMissingImports.ts", "Add missing imports in TypeScript")
create_ts_command("SortImports", "source.sortImports.ts", "Sort imports in TypeScript")
create_ts_command("OrganizeImports", "source.organizeImports.ts", "Organize imports in TypeScript")
