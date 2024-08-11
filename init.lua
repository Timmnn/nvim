require 'opts'
require 'keymap'

-- Install Lazy
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Install Plugins
require('lazy').setup({
  require 'plugins.theme', -- Catppuccin Theme
  -- require 'plugins.oil', -- File Explorer
  -- require 'plugins.tabnine', -- Local Github Copilot Alternativ
  -- require 'plugins.autosession', -- Session Manager
  -- require 'plugins.autoclose', -- Autoclose Brackets (Replaced)
  -- require 'plugins.auto-pairs', -- Autoclose Brackets
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  require 'plugins.whichkey', -- Keybind Helper
  require 'plugins.gitsigns', -- ?
  require 'plugins.telescope', -- Fuzzy Finder
  require 'plugins.feline', -- Status Line
  require 'plugins.nvim-lspconfig', -- Collection of LSP Configs
  require 'plugins.conform', -- File Formatter
  require 'plugins.luvit-meta', -- ?
  require 'plugins.nvim-cmp', -- ?
  require 'plugins.todo-comments', -- Todo Commen0ts
  require 'plugins.mini', -- ?
  require 'plugins.nvim-treesitter', -- ?
}, {
  ui = {
    icons = vim.g.have_nerd_font,
  },
})

vim.cmd.colorscheme 'catppuccin'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et:
