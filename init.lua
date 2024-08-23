require 'opts'
require 'keymap'

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out,                            'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Install Plugins
require('lazy').setup {
  spec = {
    {
      'williamboman/mason.nvim',
      opts = {},
    },
    {
      "tadmccorkle/markdown.nvim",
      ft = "markdown", -- or 'event = "VeryLazy"'
      opts = {
        -- configuration here or empty for defaults
      },
      config = function()
        require('markdown').setup({})
      end
    },
    {
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
            typescript = {
              'prettier',
            },
            javascriptreact = {
              'prettier',
            },
            typescriptreact = {
              'prettier',
            },
            json = {
              "prettier"
            }
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
    },
    require 'plugins.theme', -- Catppuccin Theme

    { 'TabbyML/vim-tabby' },

    {
      'tpope/vim-fugitive',
      lazy = false,                    -- load it on startup
    },
    require 'plugins.oil',             -- File Explorer
    -- require 'plugins.tabnine', -- Local Github Copilot Alternativ
    require 'plugins.autosession',     -- Session Manager
    -- require 'plugins.autoclose', -- Autoclose Brackets (Replaced)
    require 'plugins.auto-pairs',      -- Autoclose Brackets
    'tpope/vim-sleuth',                -- Detect tabstop and shiftwidth automatically
    require 'plugins.whichkey',        -- Keybind Helper
    require 'plugins.gitsigns',        -- Git Signs
    require 'plugins.telescope',       -- Fuzzy Finder
    require 'plugins.feline',          -- Status Line
    require 'plugins.nvim-lspconfig',  -- Collection of LSP Configs
    require 'plugins.conform',         -- File Formatter
    -- require 'plugins.luvit-meta', -- ?
    require 'plugins.nvim-cmp',        -- Autocompletion
    require 'plugins.todo-comments',   -- Todo Commen0ts
    -- require 'plugins.mini', -- ?
    require 'plugins.nvim-treesitter', -- Navigating Syntax Tree
  },
}

vim.cmd.colorscheme 'catppuccin'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et:
