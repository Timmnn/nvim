-- https://github.com/github/copilot.vim
-- Neovim plugin for GitHub Copilot

vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

return {
  'github/copilot.vim',
}
