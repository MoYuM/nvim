local ls = require("luasnip")
local f = ls.function_node
local postfix = require("luasnip.extras.postfix").postfix

local function firstToUpper(str)
	return str:gsub("^%l", string.upper)
end

ls.add_snippets("typescriptreact", {
	postfix(".useState", {
		f(function(_, parent)
			local text = parent.snippet.env.POSTFIX_MATCH
			return table.concat({ "const [", text, ", ", "set" .. firstToUpper(text), "] = React.useState();" })
		end, {}),
	}),
	postfix(".log", {
		f(function(_, parent)
			local text = parent.snippet.env.POSTFIX_MATCH
			return table.concat({
				'console.log("%c',
				text,
				' ====>",',
				'"color: red;font-size:18px;font-weigt:500",',
				text,
				");",
			})
		end),
	}),
})
