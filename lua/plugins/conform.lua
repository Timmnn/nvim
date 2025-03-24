return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			-- Define your formatters here
			formatters_by_ft = {
				lua = { "stylua" }, -- Use stylua for Lua files
				python = { "black" }, -- Use black for Python files
				javascript = { "prettier" }, -- Use prettier for JavaScript files
				typescript = { "prettier" }, -- Use prettier for TypeScript files
				javascriptreact = { "prettier" }, -- Use prettier for React (JavaScript) files
				typescriptreact = { "prettier" }, -- Use prettier for React (TypeScript) files
				html = { "prettier" }, -- Use prettier for HTML files
				css = { "prettier" }, -- Use prettier for CSS files
				json = { "prettier" }, -- Use prettier for JSON files
				markdown = { "prettier" }, -- Use prettier for Markdown files
				rust = { "rustfmt" }, -- Use rustfmt for Rust files
				go = { "gofmt", "goimports" }, -- Use gofmt and goimports for Go files
				-- Add more filetypes and formatters as needed
			},
			-- Optional: Enable format-on-save
			format_on_save = {
				timeout_ms = 500, -- Timeout for format-on-save
				lsp_fallback = true, -- Fallback to LSP formatting if no formatter is available
			},
		})
	end,
}
