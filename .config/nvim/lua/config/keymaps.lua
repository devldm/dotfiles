-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here--force you to use nvim binds!
vim.keymap.set("n", "<Left>", ':echoe "Use h"<CR>')
vim.keymap.set("n", "<Right>", ':echoe "Use l"<CR>')
vim.keymap.set("n", "<Up>", ':echoe "Use k"<CR>')
vim.keymap.set("n", "<Down>", ':echoe "Use j"<CR>')
vim.keymap.set("i", "<Left>", '<ESC>:echoe "Use h"<CR>')
vim.keymap.set("i", "<Right>", '<ESC>:echoe "Use l"<CR>')
vim.keymap.set("i", "<Up>", '<ESC>:echoe "Use k"<CR>')
vim.keymap.set("i", "<Down>", '<ESC>:echoe "Use j"<CR>')

--when using these binds you can move a chunk of text and it will automatically indent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ensure cursor stays in place when we use J
vim.keymap.set("n", "J", "mzJ`z")

-- update half page command to keep cursor centralised
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep cursor centralised during search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "Q", "<nop>")

--copy to system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>y", '"+Y')

--allows paste without removing current buffer
vim.keymap.set("x", "<leader>p", '"_dP')

--allows use of d without copying
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')
