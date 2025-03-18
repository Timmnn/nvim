return {
	{
		"folke/tokyonight.nvim",
		lazy = false, -- Load immediately
		priority = 1000, -- Load this plugin first
		config = function()
			vim.cmd("colorscheme tokyonight") -- Set the default colorscheme
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme gruvbox")
		end,
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "rebelot/kanagawa.nvim" },
}
