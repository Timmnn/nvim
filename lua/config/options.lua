local TAB_WIDTH = 2

vim.opt.tabstop = TAB_WIDTH
vim.opt.softtabstop = TAB_WIDTH
vim.opt.shiftwidth = TAB_WIDTH

vim.g.mapleader = " "

vim.wo.number = true

vim.opt.signcolumn = "yes"

vim.opt.clipboard:append("unnamedplus")

vim.opt.whichwrap:append("<,>,h,l")

vim.g.have_nerd_font = true

vim.cmd("highlight Normal guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE")
