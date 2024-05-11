vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.wo.relativenumber = true

-- Pane navigation
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Save file
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save buffer" })

-- Buffer navigation
vim.keymap.set("n", "<A-l>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<A-h>", ":bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bb", ":b#<CR>", { desc = "Previous active buffer" })
