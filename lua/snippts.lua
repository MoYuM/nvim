local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
-- local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
-- local types = require("luasnip.util.types")
-- local parse = require("luasnip.util.parser").parse_snippet
-- local ms = ls.multi_snippet
-- local k = require("luasnip.nodes.key_indexer").new_key
--
local function capitalizeFirstLetter(str)
	return str:gsub("^%l", string.upper)
end

local log = postfix(".log", {
	l("console.log(" .. "'" .. l.POSTFIX_MATCH .. " ====> ', " .. l.POSTFIX_MATCH .. ")"),
})

local useState = postfix(".useState", {
	l("const [" .. l.POSTFIX_MATCH .. ", set" .. capitalizeFirstLetter(l.POSTFIX_MATCH) .. "] = useState()"),
})

local function fn(args)
   return args[1][1]
end

local fc = s("fc", {
  t({"type "}), f(fn, {1}), t({"Props = {", ""}),
  i(2), t({"", ""}),
  t({"}", ""}),
  t({"", ""}),
  t({"const "}), i(1), t({":FC<"}),f(fn, {1}), t({"Props> = () => {", ""}),
  t({"  return (", ""}),
  t({"    <div></div>", ""}),
  t({"  )", ""}),
  t({"}", ""}),
  t("export default "), f(fn, {1})
})


-- ls.add_snippets("all", {
-- 	log,
-- 	useState,
-- 	fc,
-- })
