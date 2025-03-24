local function CreateSnippets()
	local ls = require("luasnip")
	local fmt = require("luasnip.extras.fmt").fmt

	require("config.snippets.rust").CreateSnippets(ls, fmt)
end

return {
	CreateSnippets = CreateSnippets,
}
