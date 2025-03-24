return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "rust_analyzer" },
			})
		end,
	},
	{

		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.rust_analyzer.setup({})
			lspconfig.emmet_language_server.setup({})
			lspconfig.ts_ls.setup({})

			vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover)
			vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float)
			vim.keymap.set("n", "<leader>lg", vim.lsp.buf.definition)

			local wk = require("which-key")
			wk.add({
				{ "<leader>l", group = "LSP" },
				{ "<leader>lh", desc = "Hover" },
			})
		end,
	},
}
