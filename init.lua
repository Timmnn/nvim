require 'opts'
require 'keymap'
require 'lazy_install'


-- Install Plugins
require('lazy').setup {
  spec = {
    require 'plugins.mason',
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
    require 'plugins.theme', -- Catppuccin Theme

    -- { 'TabbyML/vim-tabby' },
    {
      'nvim-treesitter/nvim-treesitter'
    },
    {
      'tpope/vim-fugitive',
      lazy = false,                -- load it on startup
    },
    require 'plugins.oil',         -- File Explorer
    -- require 'plugins.tabnine', -- Local Github Copilot Alternativ
    require 'plugins.autosession', -- Session Manager
    -- require 'plugins.autoclose', -- Autoclose Brackets (Replaced)
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
    require 'plugins.auto-pairs', -- Autoclose Brackets
    'tpope/vim-sleuth',           -- Detect tabstop and shiftwidth automatically
    require 'plugins.whichkey',   -- Keybind Helper
    require 'plugins.gitsigns',   -- Git Signs
    require 'plugins.telescope',  -- Fuzzy Finder
    require 'plugins.feline',     -- Status Line
    {
      "mbbill/undotree"
    },
    require 'plugins.nvim-lspconfig', -- Collection of LSP Configs
    require 'plugins.conform',        -- File Formatter
    -- require 'plugins.luvit-meta', -- ?
    require 'plugins.nvim-cmp',       -- Autocompletion


    -- Luasnip (required for snippets)
    {
      'L3MON4D3/LuaSnip',
      version = '1.*',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()

        vim.keymap.set({ "i", "s" }, "<C-k>", function()
          if require("luasnip").expand_or_jumpable() then
            require("luasnip").expand_or_jump()
          end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-j>", function()
          if require("luasnip").jumpable(-1) then
            require("luasnip").jump(-1)
          end
        end, { silent = true })
      end,
    },


    -- Friendly snippets (set of preconfigured snippets)
    {
      'rafamadriz/friendly-snippets',
      dependencies = { 'L3MON4D3/LuaSnip' },
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      }
    }
  }
}

vim.cmd.colorscheme 'catppuccin'


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et:

-- Needed on windows
if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
  require 'nvim-treesitter.install'.compilers = { "clang" }
end

vim.api.nvim_set_keymap('n', '<leader>tg', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
