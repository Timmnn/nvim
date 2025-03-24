local function CreateSnippets(ls, fmt)
	local s = ls.snippet
	local t = ls.text_node
	local i = ls.insert_node
	local c = ls.choice_node
	local sn = ls.snippet_node
	local d = ls.dynamic_node
	local extras = require("luasnip.extras")
	local events = require("luasnip.util.events")

	ls.add_snippets("rust", {
		s(
			"trait",
			fmt(
				[[
				trait {} {{
					{}
				}}
				]],
				{
					i(1), -- Trait Name
					i(0), -- Trait Body
				}
			)
		),
	})
end

return {
	CreateSnippets = CreateSnippets,
}
