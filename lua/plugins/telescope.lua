return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-h>"] = "which_key",
					},
				},
			},
			pickers = {},
			extensions = {},
		})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>tf", builtin.find_files)
		vim.keymap.set("n", "<leader>tg", builtin.live_grep)
		vim.keymap.set("n", "<leader>tb", builtin.buffers)

		local wk = require("which-key")
		wk.add({
			{ "<leader>t", group = "Telescope" },
			{ "<leader>tf", desc = "Find File" },
			{ "<leader>tg", desc = "Find in Files" },
			{ "<leader>tb", desc = "Find Buffer" },
		})
	end,
}
