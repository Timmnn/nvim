require 'opts'
require 'keymap'
require 'lazy_install'


--TODO: folding functions: showing function headers on top of window (um zu sehen in welche funtion man ist)

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
      },

      config = function()
        require("neo-tree").setup {
          filesystem = {
            follow_current_file = {
              enabled = true
            }
          }
        }
        vim.keymap.set("n", "-", ":Neotree toggle<CR>", { silent = true })
      end
    },
    {
      "f-person/git-blame.nvim",
      -- load the plugin at startup
      event = "VeryLazy",
      -- Because of the keys part, you will be lazy loading this plugin.
      -- The plugin wil only load once one of the keys is used.
      -- If you want to load the plugin at startup, add something like event = "VeryLazy",
      -- or lazy = false. One of both options will work.
      opts = {
        -- your configuration comes here
        -- for example
        enabled = true, -- if you want to enable the plugin
        message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
        date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
        virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
      },

    }
  }
}

vim.cmd.colorscheme 'catppuccin-macchiato'


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et:

-- Needed on windows
vim.api.nvim_set_keymap('n', '<leader>tg', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
