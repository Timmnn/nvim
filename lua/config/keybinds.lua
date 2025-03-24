vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "Go to right window" })

vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

vim.keymap.set("n", "<Esc>", ":noh<CR>", { desc = "Go to right window" })
