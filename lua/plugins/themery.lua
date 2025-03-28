return {
	"zaldih/themery.nvim",
	config = function()
		require("themery").setup({
			themes = {
				{
					name = "tokyonight",
					colorscheme = "tokyonight",
				},
				{
					name = "gruvbox",
					colorscheme = "gruvbox",
				},

				{
					name = "catppuccin-latte",
					colorscheme = "catppuccin-latte",
				},
				{
					name = "catppuccin-frappe",
					colorscheme = "catppuccin-frappe",
				},
				{
					name = "catppuccin-macchiato",
					colorscheme = "catppuccin-macchiato",
				},
				{
					name = "catppuccin-mocha",
					colorscheme = "catppuccin-mocha",
				},
				{
					name = "kanagawa",
					colorscheme = "kanagawa",
				},
			},
			livePreview = true,
		})
	end,
}
