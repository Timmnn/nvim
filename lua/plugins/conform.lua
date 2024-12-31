-- https://github.com/stevearc/conform.nvim
-- Formatter for Neovim


return {
  'stevearc/conform.nvim',
  event = {
    'BufReadPre',
    'BufNewFile',
  },
  config = function()
    local conform = require 'conform'
    conform.setup {
      formatters_by_ft = {
        javascript = {
          'prettier',
        },
        vue = {
          'prettier'
        },
        typescript = {
          'prettier',
        },
        javascriptreact = {
          'prettier',
        },
        scss = {
          'prettier',
        },
        typescriptreact = {
          'prettier'
        },
        tsx = { "prettier" },
        ["d.ts"] = { "prettier" }, -- For .d.ts files
        json = {
          "prettier"
        },
        rust = {
          "rustfmt"
        },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout = 1000,
      },
    }
    vim.keymap.set({ 'n', 'v' }, '<leader>mp', function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout = 1000,
      }
    end, { desc = 'Format file or range(in visual mode)' })
  end,
}
